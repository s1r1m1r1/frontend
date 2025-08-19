import 'package:bloc/bloc.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';

class LogoutCubit extends Cubit<LogoutStatus> {
  final AuthRepository _repository;
  LogoutCubit(this._repository) : super(LogoutStatus.initial);

  void logout() {
    emit(LogoutStatus.loading);
    _repository.logOut();
    emit(LogoutStatus.success);
  }
}

enum LogoutStatus { initial, loading, success }
