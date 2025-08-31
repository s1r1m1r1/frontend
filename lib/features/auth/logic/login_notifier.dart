import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:frontend/core/network/api_exception.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/token_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_notifier.freezed.dart';

@injectable
class LoginNotifier extends LogNotifier<LoginState> {
  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;

  LoginNotifier(this._authRepository, this._tokenRepository)
    : super(LoginInitial());

  Future<void> loginButtonPressed({
    required String username,
    required String password,
  }) async {
    value = const LoginState.loading();
    log('on Pressed');
    try {
      final tokens = await _authRepository
          .login(username, password)
          .timeout(Duration(seconds: 5));
      await _tokenRepository.putAccessToken(tokens.access);
      _tokenRepository.accessNtf.value = tokens.access;
      await _tokenRepository.putRefreshToken(tokens.refresh);
      _tokenRepository.refreshNtf.value = tokens.refresh;

      log('success');
      value = LoginState.success();
    } on TimeoutException {
      value = const LoginState.failure(LoginError.timeout);
    } on WrongLoginApiException {
      value = const LoginState.failure(LoginError.wrongLogin);
    } on Object catch (e, s) {
      addError(e, s);
      value = LoginFailure(LoginError.unknown);
    }
  }
}

enum LoginError { timeout, wrongLogin, unknown, none }

@freezed
abstract class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.failure(LoginError error) = LoginFailure;
}
