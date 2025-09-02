import 'dart:async';

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

@lazySingleton
class SessionNotifier extends LogNotifier<Session> {
  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;
  final WsRepository _wsRepository;
  StreamSubscription<AuthTC>? _sub;
  SessionNotifier(
    this._authRepository,
    this._tokenRepository,
    this._wsRepository,
  ) : super(const Session.initial());

  FutureOr<void> readSession() async {
    final token = await _tokenRepository.readAccessToken();
    final refresh = await _tokenRepository.readRefreshToken();
    if (refresh == null || token == null) {
      value = const Session.logout(SessionError.expired);
      return;
    }
    _tokenRepository.accessNtf.value = token;
    _tokenRepository.refreshNtf.value = refresh;
    value = Session.pending();
    final session = await _authRepository.checkToken(token);
    if (session == null) {
      value = const Session.logout(SessionError.notFound);
      return;
    }
    value = session;
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
              if (refresh == null) value = Session.logout(SessionError.expired);
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
              if (value is WsSession) {
                value = (value as WsSession).copyWith(
                  status: WSSessionStatus.disconnectedByAnother,
                );
              } else {
                value = Session.logout(SessionError.expired);
              }
              break;
            case WsAuthError.sessionClosed:
              break;
          }
        case JoinedServerTC(:final mainRoomId, :final user, :final unit):
          final newSession = Session.ws(
            gameOption: WsGameOption(mainRoomId: mainRoomId),
            user: User.fromDto(user),
            unit: Unit.fromDto(unit),
            status: WSSessionStatus.connected,
          );
          value = newSession;
      }
    });
  }

  void joinWs(String token) {
    if (value is WsSession) {
      _wsRepository.toServer(ToServer.withToken(token));
      value = (value as WsSession).copyWith(status: WSSessionStatus.connecting);
    }
  }

  Future<void> logout() async {
    _tokenRepository.accessNtf.value = null;
    _tokenRepository.refreshNtf.value = null;
    await _tokenRepository.deleteAccessToken();
    await _tokenRepository.deleteRefreshToken();
    _wsRepository.toServer(ToServer.disconnect());
    value = const Session.logout(SessionError.expired);
  }

  @override
  Future<void> dispose() async {
    _sub?.cancel();
    return super.dispose();
  }
}
