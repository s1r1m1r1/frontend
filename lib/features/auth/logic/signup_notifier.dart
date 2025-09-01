import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/token_repository.dart';
import 'package:injectable/injectable.dart';

part 'signup_notifier.freezed.dart';

@injectable
class SignupNotifier extends LogNotifier<SignupState> {
  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;

  SignupNotifier(this._authRepository, this._tokenRepository)
    : super(SignupInitial());

  void signupPressed({required String email, required String password}) async {
    value = SignupState.loading();
    try {
      final tokens = await _authRepository
          .signup(email, password)
          .timeout(Duration(seconds: 5));
      await _tokenRepository.putAccessToken(tokens.access);
      await _tokenRepository.putRefreshToken(tokens.refresh);
      _tokenRepository.accessNtf.value = tokens.access;
      _tokenRepository.refreshNtf.value = tokens.refresh;
      value = SignupState.success();
    } on TimeoutException {
      value = SignupFailure(SignupError.timeout);
    } catch (e) {
      value = SignupFailure(SignupError.unknown);
    }
  }
}

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
  const factory SignupState.success() = SignupSuccess;
  const factory SignupState.failure(SignupError error) = SignupFailure;
}
