part of 'ws_signup.bloc.dart';

abstract class WsSignupEvent extends Equatable {
  const WsSignupEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends WsSignupEvent {
  final String email;
  final String password;

  const SignupButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
