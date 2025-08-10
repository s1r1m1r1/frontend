part of 'ws_login.bloc.dart';

abstract class WsLoginEvent extends Equatable {
  const WsLoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends WsLoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
