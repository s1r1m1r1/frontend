part of 'session.bloc.dart';

@freezed
abstract class SessionEvent with _$SessionEvent {
  const factory SessionEvent.read() = _ReadSessionSE;
  const factory SessionEvent.setSession(Session? session) = _SetSessionSE;
  const factory SessionEvent.joinWs(String token) = _JoinWsSE;
  const factory SessionEvent.subscribeWs() = _SubscribeWsSE;
  const factory SessionEvent.updateSession(Session session) = _UpdateSessionSE;
  const factory SessionEvent.logout() = _LogoutSE;
  const factory SessionEvent.updateTokensOnRefresh(
    Completer<String?> completer,
  ) = _UpdateTokensOnRefreshSE;
}
