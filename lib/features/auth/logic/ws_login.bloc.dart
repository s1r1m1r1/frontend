import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

part 'ws_login.event.dart';
part 'ws_login.state.dart';

@injectable
class WsLoginBloc extends Bloc<WsLoginEvent, WsLoginState> {
  final AuthRepository _authRepository;

  WsLoginBloc(this._authRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<WsLoginState> emit) async {
    emit(LoginLoading());
    try {
      _authRepository.wsLogin(event.username, event.password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
