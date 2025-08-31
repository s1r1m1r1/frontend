import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/token_repository.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';
import 'package:sha_red/sha_red.dart';

import '../../unit/domain/unit.dart';
import '../domain/auth_repository.dart';
import '../domain/user.dart';
part 'session_notifier.freezed.dart';

// part 'session.event.dart';
// part 'session.bloc.freezed.dart';

@lazySingleton
class SessionNotifier extends LogNotifier<SessionState> {
  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;
  final WsRepository _wsRepository;
  StreamSubscription<AuthTC>? _sub;
  SessionNotifier(
    this._authRepository,
    this._tokenRepository,
    this._wsRepository,
  ) : super(const SessionState());

  FutureOr<void> readSession() async {
    final token = await _tokenRepository.readAccessToken();
    final refresh = await _tokenRepository.readRefreshToken();
    if (refresh == null || token == null) {
      value = SessionState.logout;
      return;
    }
    _tokenRepository.accessNtf.value = token;
    _tokenRepository.refreshNtf.value = refresh;
    value = SessionState.has(Session.pending());
    final session = await _authRepository.checkToken(token);
    if (session == null) {
      value = SessionState.logout;
      return;
    }
    value = SessionState.has(session);
    // add(SessionEvent.updateSession(session: pending));
  }

  FutureOr<void> subscribeWs() async {
    _sub?.cancel();
    _sub = _wsRepository.toClientStream.whereType<AuthTC>().listen((
      AuthTC data,
    ) async {
      switch (data) {
        case AuthErrorTC(:final error):
          switch (error) {
            case WsAuthError.expiredToken:
              final refresh = _tokenRepository.refreshNtf.value;
              if (refresh == null) value = SessionState.logout;
              final record = await _authRepository.fetchRefreshToken(refresh!);
              if (record != null) {
                _tokenRepository.putAccessToken(record.token);
                _tokenRepository.accessNtf.value = record.token;
                _tokenRepository.putRefreshToken(record.refresh);
                _tokenRepository.refreshNtf.value = record.refresh;
                joinWs(record.token);
              }

            // unexpected
            case WsAuthError.unknown:
              break;
            // no session , try to refresh token
            case WsAuthError.tokenSessionNotFound:
              break;
            // continue as new session ,another session stopped
            case WsAuthError.continueAsNewSession:
              break;
            // stopped by other new session enter
            case WsAuthError.stoppedByAnotherSession:
              break;
            case WsAuthError.sessionClosed:
              break;
          }
        case JoinedServerTC(:final mainRoomId, :final user, :final unit):
          final newSession = Session.gameJoined(
            gameOption: WsGameOption(mainRoomId: mainRoomId),
            user: User.fromDto(user),
            unit: Unit.fromDto(unit),
          );
          value = SessionState.has(newSession);
      }
    });
  }

  void joinWs(String token) {
    _wsRepository.toServer(ToServer.withToken(token));
    value = value.copyWith(status: SessionStateStatus.connecting);
    return;
  }

  @override
  Future<void> dispose() async {
    return super.dispose();
  }
}

enum SessionStateStatus { initial, updating, connecting, idle, expired }

@freezed
sealed class SessionState with _$SessionState {
  const SessionState._();
  const factory SessionState({
    @Default(SessionStateStatus.initial) SessionStateStatus status,
    Session? session,
    String? errorMessage,
  }) = _SessionState;
  //-------------------------------------------------------------------------
  //-------------------------------------------------------------------------
  //-------------------------------------------------------------------------
  static SessionState has(Session session) => _SessionState(
    session: session,
    status: SessionStateStatus.idle,
    errorMessage: null,
  );

  static const logout = _SessionState(
    status: SessionStateStatus.expired,
    session: null,
    errorMessage: null,
  );
}
