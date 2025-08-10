import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

part 'ws_signup.event.dart';
part 'ws_signup.state.dart';

@injectable
class WsSignupBloc extends Bloc<WsSignupEvent, WsSignupState> {
  final AuthRepository _authRepository;

  WsSignupBloc(this._authRepository) : super(SignupInitial()) {
    on<SignupButtonPressed>(_onSignupButtonPressed);
  }

  void _onSignupButtonPressed(SignupButtonPressed event, Emitter<WsSignupState> emit) async {
    emit(SignupLoading());
    try {
      await _authRepository.signup(event.email, event.password);
      emit(const SignupSuccess('Signup successful! Please log in.'));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
