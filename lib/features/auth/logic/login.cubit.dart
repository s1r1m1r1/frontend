import 'package:bloc/bloc.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> loginButtonPressed({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final response = await _authRepository.login(username, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

@freezed
abstract class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.failure(String error) = LoginFailure;
}
