import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frontend/core/network/api_exception.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/session.dart';

part 'login.cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> loginButtonPressed({
    required String username,
    required String password,
  }) async {
    emit(const LoginState.loading());
    try {
      final session = await _authRepository
          .login(username, password)
          .timeout(Duration(seconds: 5));
      emit(LoginState.success(session));
    } on TimeoutException {
      emit(const LoginState.failure(LoginError.timeout));
    } on WrongLoginApiException {
      emit(const LoginState.failure(LoginError.wrongLogin));
    } on Object catch (e, s) {
      addError(e, s);
      emit(LoginFailure(LoginError.unknown));
    }
  }
}

enum LoginError { timeout, wrongLogin, unknown, none }

@freezed
abstract class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success(Session session) = LoginSuccess;
  const factory LoginState.failure(LoginError error) = LoginFailure;
}
