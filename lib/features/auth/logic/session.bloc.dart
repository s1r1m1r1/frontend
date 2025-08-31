// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:frontend/core/network/ws_repository.dart';
// import 'package:frontend/features/auth/domain/session.dart';
// import 'package:frontend/features/auth/domain/token_repository.dart';
// import 'package:frontend/features/auth/domain/ws_game_option.dart';
// import 'package:injectable/injectable.dart';
// import 'package:rxdart/transformers.dart';
// import 'package:sha_red/sha_red.dart';

// import '../../unit/domain/unit.dart';
// import '../domain/auth_repository.dart';
// import '../domain/user.dart';

// part 'session.state.dart';
// part 'session.event.dart';
// part 'session.bloc.freezed.dart';

// @lazySingleton
// class SessionBloc extends Bloc<SessionEvent, SessionState> {
//   final AuthRepository _authRepository;
//   final TokenRepository _tokenRepository;
//   final WsRepository _wsRepository;
//   SessionBloc(this._authRepository, this._tokenRepository, this._wsRepository)
//     : super(const SessionState()) {
//     on<_ReadSessionSE>(_onReadSession);
//     on<_SubscribeWsSE>(_onSubscribeWs);
//     on<_JoinWsSE>(_onJoinWs);
//     on<_UpdateTokensOnRefreshSE>(_onUpdateTokensOnRefresh);
//   }

//   FutureOr<void> _onReadSession(
//     _ReadSessionSE event,
//     Emitter<SessionState> emit,
//   ) async {
//     final token = await _tokenRepository.readAccessToken();
//     final refresh = await _tokenRepository.readRefreshToken();
//     if (refresh == null || token == null) {
//       emit(SessionState.logout);
//       return;
//     }
//     _tokenRepository.accessNtf.value = token;
//     _tokenRepository.refreshNtf.value = refresh;
//     emit(SessionState.has(Session.pending()));
//     final session = await _authRepository.checkToken(token);
//     if (session == null) {
//       emit(SessionState.logout);
//       return;
//     }
//     emit(SessionState.has(session));
//     // add(SessionEvent.updateSession(session: pending));
//   }

//   FutureOr<void> _onSubscribeWs(
//     _SubscribeWsSE event,
//     Emitter<SessionState> emit,
//   ) async {
//     await emit.onEach(
//       _wsRepository.toClientStream.whereType<AuthTC>(),
//       onData: (AuthTC data) async {
//         switch (data) {
//           case AuthErrorTC(:final error):
//             switch (error) {
//               case WsAuthError.expiredToken:
//                 final refresh = _tokenRepository.refreshNtf.value;
//                 if (refresh == null) emit(SessionState.logout);
//                 final record = await _authRepository.fetchRefreshToken(
//                   refresh!,
//                 );
//                 if (record != null) {
//                   _tokenRepository.putAccessToken(record.token);
//                   _tokenRepository.accessNtf.value = record.token;
//                   _tokenRepository.putRefreshToken(record.refresh);
//                   _tokenRepository.refreshNtf.value = record.refresh;
//                   add(SessionEvent.joinWs(record.token));
//                 }

//               // unexpected
//               case WsAuthError.unknown:
//                 break;
//               // no session , try to refresh token
//               case WsAuthError.tokenSessionNotFound:
//                 break;
//               // continue as new session ,another session stopped
//               case WsAuthError.continueAsNewSession:
//                 break;
//               // stopped by other new session enter
//               case WsAuthError.stoppedByAnotherSession:
//                 break;
//               case WsAuthError.sessionClosed:
//                 break;
//             }
//           case JoinedServerTC(:final mainRoomId, :final user, :final unit):
//             final newSession = Session.gameJoined(
//               gameOption: WsGameOption(mainRoomId: mainRoomId),
//               user: User.fromDto(user),
//               unit: Unit.fromDto(unit),
//             );
//             emit(SessionState.has(newSession));
//         }
//       },
//     );
//   }

//   void _onJoinWs(_JoinWsSE event, Emitter<SessionState> emit) {
//     _wsRepository.toServer(ToServer.withToken(event.token));
//     emit(state.copyWith(status: SessionStateStatus.connecting));
//     return;
//   }

//   @override
//   Future<void> close() async {
//     return await super.close();
//   }

//   FutureOr<void> _onUpdateTokensOnRefresh(
//     _UpdateTokensOnRefreshSE event,
//     Emitter<SessionState> emit,
//   ) async {
//     final refresh = _tokenRepository.refreshNtf.value;
//     if (refresh == null) {
//       event.completer.completeError(
//         'Failed to refresh token',
//         StackTrace.current,
//       );
//       emit(SessionState.logout);
//       return;
//     }
//     try {
//       final record = await _authRepository
//           .fetchRefreshToken(refresh)
//           .timeout(Duration(seconds: 5));
//       if (record != null) {
//         event.completer.complete(record.token);
//       } else {
//         event.completer.completeError(
//           'Failed to refresh token',
//           StackTrace.current,
//         );
//       }
//     } on TimeoutException catch (e) {
//       emit(SessionState.logout);
//       event.completer.completeError(e);
//     } on Object catch (e) {
//       event.completer.completeError(e);
//     }
//   }
// }
