import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:injectable/injectable.dart';
part 'ws_join_cubit.freezed.dart';

@injectable
class WsJoinCubit extends Cubit<WsJoinState> {
  final AuthRepository _authRepository;
  WsJoinCubit(this._authRepository) : super(WsJoinState.initial());

  void subscribe() {
    _authRepository.sessionNtf.addListener(listen);
    listen();
  }

  void listen() {
    final session = _authRepository.sessionNtf.value;
    if (session is GameJoinedSession) {
      emit(WsJoinState.connected());
    }
  }

  void wsJoin() {
    emit(WsJoinState.connecting());
    _authRepository.wsJoin();
  }

  @override
  Future<void> close() {
    _authRepository.sessionNtf.removeListener(listen);
    return super.close();
  }
}

@freezed
sealed class WsJoinState with _$WsJoinState {
  const factory WsJoinState.initial() = InitialWsJoin;
  const factory WsJoinState.connecting() = ConnectingWsJoin;
  const factory WsJoinState.connected() = ConnectedWsJoin;
  const factory WsJoinState.disconnected() = DisconnectedWsJoin;
}
