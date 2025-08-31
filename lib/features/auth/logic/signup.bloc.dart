import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/token_repository.dart';
import 'package:injectable/injectable.dart';

part 'signup.event.dart';
part 'signup.state.dart';
part 'signup.bloc.freezed.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;

  SignupBloc(this._authRepository, this._tokenRepository)
    : super(SignupInitial()) {
    on<_SubmitPressedSE>(_onSignupButtonPressed);
  }

  void _onSignupButtonPressed(
    _SubmitPressedSE event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupState.loading());
    try {
      final tokens = await _authRepository
          .signup(event.email, event.password)
          .timeout(Duration(seconds: 5));
      await _tokenRepository.putAccessToken(tokens.access);
      await _tokenRepository.putRefreshToken(tokens.refresh);
      _tokenRepository.accessNtf.value = tokens.access;
      _tokenRepository.refreshNtf.value = tokens.refresh;
      emit(SignupState.success());
    } on TimeoutException {
      emit(SignupFailure(SignupError.timeout));
    } catch (e) {
      emit(SignupFailure(SignupError.unknown));
    }
  }
}
