part of 'signup.bloc.dart';

@freezed
abstract class SignupEvent with _$SignupEvent {
  const factory SignupEvent.submitPressed({
    required String email,
    required String password,
  }) = _SubmitPressedSE;
}
