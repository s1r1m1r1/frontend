import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:injectable/injectable.dart';

import '../../auth/domain/session_repository.dart';
part 'ws_join_cubit.freezed.dart';

@injectable
class WsJoinCubit extends Cubit<WsJoinState> {
  final SessionRepository _repository;
  WsJoinCubit(this._repository) : super(WsJoinState.initial());

  void subscribe() {
    _repository.sessionNtf.addListener(listen);
    listen();
  }

  void listen() {
    final session = _repository.sessionNtf.value;
    if (session is GameJoinedSession) {
      emit(WsJoinState.connected());
    }
  }

  void wsJoin() {
    emit(WsJoinState.connecting());
    _repository.wsJoin();
  }

  @override
  Future<void> close() {
    _repository.sessionNtf.removeListener(listen);
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
