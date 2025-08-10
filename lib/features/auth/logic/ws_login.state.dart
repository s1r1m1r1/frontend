part of 'ws_login.bloc.dart';

abstract class WsLoginState extends Equatable {
  const WsLoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends WsLoginState {}

class LoginLoading extends WsLoginState {}

class LoginSuccess extends WsLoginState {
  const LoginSuccess();
}

class LoginFailure extends WsLoginState {
  final String error;
  const LoginFailure(this.error);
  @override
  List<Object> get props => [error];
}
