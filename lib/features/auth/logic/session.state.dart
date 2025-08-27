part of 'session.bloc.dart';

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
