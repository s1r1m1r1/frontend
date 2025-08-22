import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:injectable/injectable.dart';

import '../../auth/domain/session_repository.dart';
part 'ws_join_cubit.freezed.dart';

@injectable
class WsJoinCubit extends Cubit<WsJoinState> {
  final SessionRepository _repository;
  StreamSubscription? _sub;
  WsJoinCubit(this._repository) : super(WsJoinState.initial());

  void subscribe() {
    _sub?.cancel();
    _sub = _repository.sessionStream.listen(_listen);
  }

  void _listen(Session? session) {
    if (session case GameJoinedSession(:final gameOption)) {
      emit(WsJoinState.connected(gameOption.mainRoomId));
    }
  }

  void wsJoin() {
    emit(WsJoinState.connecting());
    _repository.wsJoin();
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}

@freezed
sealed class WsJoinState with _$WsJoinState {
  const factory WsJoinState.initial() = InitialWsJoin;
  const factory WsJoinState.connecting() = ConnectingWsJoin;
  const factory WsJoinState.connected(String roomId) = ConnectedWsJoin;
  const factory WsJoinState.disconnected() = DisconnectedWsJoin;
}
