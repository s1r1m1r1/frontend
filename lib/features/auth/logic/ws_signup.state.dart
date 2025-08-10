part of 'ws_signup.bloc.dart';

abstract class WsSignupState extends Equatable {
  const WsSignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends WsSignupState {}

class SignupLoading extends WsSignupState {}

class SignupSuccess extends WsSignupState {
  final String message;
  const SignupSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class SignupFailure extends WsSignupState {
  final String error;
  const SignupFailure(this.error);
  @override
  List<Object> get props => [error];
}
