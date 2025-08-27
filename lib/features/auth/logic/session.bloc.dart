import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';
import 'package:sha_red/sha_red.dart';

import '../../unit/domain/unit.dart';
import '../domain/auth_repository.dart';
import '../domain/user.dart';

part 'session.state.dart';
part 'session.event.dart';
part 'session.bloc.freezed.dart';

@lazySingleton
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final AuthRepository _authRepository;
  final SessionRepository _sessionRepository;
  final WsRepository _wsRepository;
  SessionBloc(this._authRepository, this._sessionRepository, this._wsRepository)
    : super(const SessionState()) {
    on<_ReadSessionSE>(_onReadSession);
    on<_SetSessionSE>(_onSetSession);
    on<_SubscribeWsSE>(_onSubscribeWs);
    on<_UpdateSessionSE>(_onUpdateSession);
    on<_JoinWsSE>(_onJoinWs);
    on<_UpdateTokensOnRefreshSE>(_onUpdateTokensOnRefresh);
  }

  FutureOr<void> _onReadSession(
    _ReadSessionSE event,
    Emitter<SessionState> emit,
  ) async {
    final token = await _sessionRepository.readAccessToken();
    final refresh = await _sessionRepository.readRefreshToken();
    if (refresh == null) {
      emit(SessionState.logout);
      return;
    }
    final pending = PendingSession(accessToken: token, refreshToken: refresh);
    add(SessionEvent.updateSession(pending));
  }

  FutureOr<void> _onSubscribeWs(
    _SubscribeWsSE event,
    Emitter<SessionState> emit,
  ) async {
    await emit.onEach(
      _wsRepository.toClientStream.whereType<AuthTC>(),
      onData: (AuthTC data) async {
        switch (data) {
          case AuthErrorTC(:final error):
            switch (error) {
              case WsAuthError.expiredToken:
                _sessionRepository.deleteAccessToken();
                emit(
                  state.copyWith(
                    session: state.session?.copyWith(accessToken: null),
                  ),
                );
                final completer = Completer<String?>();
                add(SessionEvent.updateTokensOnRefresh(completer));
                completer.future.then((token) {
                  if (token != null) {
                    add(SessionEvent.joinWs(token));
                  }
                });
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
          case JoinedServerTC(
            :final mainRoomId,
            :final user,
            :final unit,
            :final tokens,
          ):
            final newSession = Session.gameJoined(
              gameOption: WsGameOption(mainRoomId: mainRoomId),
              user: User.fromDto(user),
              unit: Unit.fromDto(unit),
              accessToken: tokens.accessToken,
              refreshToken: tokens.refreshToken,
            );
            emit(SessionState.has(newSession));
        }
      },
    );
  }

  FutureOr<void> _onUpdateSession(
    _UpdateSessionSE event,
    Emitter<SessionState> emit,
  ) async {
    if (state.status == SessionStateStatus.updating) return;
    emit(
      state.copyWith(
        session: event.session,
        status: SessionStateStatus.updating,
      ),
    );
    try {
      final token = event.session.accessToken;
      if (token == null) {
        final refresh = event.session.refreshToken;
        final session = await _authRepository.updateTokensOnRefresh(refresh);
        if (session == null) {
          emit(SessionState.logout);
          return;
        }
        emit(SessionState.has(session));
        return;
      }
      final session = await _authRepository.checkToken(token);
      if (session == null) {
        emit(SessionState.logout);
        return;
      }
      emit(SessionState.has(session));
      return;
    } catch (e) {
      emit(
        state.copyWith(session: event.session, status: SessionStateStatus.idle),
      );
    }
  }

  void _onJoinWs(_JoinWsSE event, Emitter<SessionState> emit) {
    _wsRepository.toServer(ToServer.withToken(event.token));
    emit(state.copyWith(status: SessionStateStatus.connecting));
    return;
  }

  @override
  Future<void> close() async {
    return await super.close();
  }

  FutureOr<void> _onUpdateTokensOnRefresh(
    _UpdateTokensOnRefreshSE event,
    Emitter<SessionState> emit,
  ) async {
    final refresh = state.session?.refreshToken;
    if (refresh == null) {
      event.completer.completeError(
        'Failed to refresh token',
        StackTrace.current,
      );
      emit(SessionState.logout);
      return;
    }
    try {
      final session = await _authRepository
          .updateTokensOnRefresh(refresh)
          .timeout(Duration(seconds: 5));
      if (session != null) {
        event.completer.complete(session.accessToken);
      } else {
        event.completer.completeError(
          'Failed to refresh token',
          StackTrace.current,
        );
      }
    } on TimeoutException catch (e) {
      emit(SessionState.logout);
      event.completer.completeError(e);
    } on Object catch (e) {
      event.completer.completeError(e);
    }
  }

  void _onSetSession(_SetSessionSE event, Emitter<SessionState> emit) {
    if (event.session == null) return;
    emit(SessionState.has(event.session!));
  }
}
