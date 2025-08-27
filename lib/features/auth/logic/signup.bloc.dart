import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../domain/session.dart';

part 'signup.event.dart';
part 'signup.state.dart';
part 'signup.bloc.freezed.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;

  SignupBloc(this._authRepository) : super(SignupInitial()) {
    on<_SubmitPressedSE>(_onSignupButtonPressed);
  }

  void _onSignupButtonPressed(
    _SubmitPressedSE event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupState.loading());
    try {
      final session = await _authRepository
          .signup(event.email, event.password)
          .timeout(Duration(seconds: 5));
      emit(SignupState.success(session));
    } on TimeoutException {
      emit(SignupFailure(SignupError.timeout));
    } catch (e) {
      emit(SignupFailure(SignupError.unknown));
    }
  }
}
