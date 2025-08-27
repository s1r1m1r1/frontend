part of 'signup.bloc.dart';

enum SignupError {
  timeout,
  incorrectEmail,
  weakPassword,
  alreadyExist,
  unknown,
  none,
}

@freezed
abstract class SignupState with _$SignupState {
  const SignupState._();
  const factory SignupState.initial() = SignupInitial;
  const factory SignupState.loading() = SignupLoading;
  const factory SignupState.success(Session session) = SignupSuccess;
  const factory SignupState.failure(SignupError error) = SignupFailure;
}
