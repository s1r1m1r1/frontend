import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';
import 'package:sha_red/sha_red.dart';
part 'arena_board_notifier.freezed.dart';

@injectable
class ArenaBoardNotifier extends ValueNotifier<ArenaBoardState> {
  final WsRepository _wsRepository;
  ArenaBoardNotifier(this._wsRepository) : super(ArenaBoardState(edicts: []));
  StreamSubscription? _sub;

  void subscribe() {
    _sub?.cancel();
    _sub = _wsRepository.toClientStream.whereType<ActiveEdictsTC>().listen((
      event,
    ) {
      value = ArenaBoardState(edicts: event.edicts);
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    leaveArena();
    super.dispose();
  }

  void joinArena() {
    _wsRepository.toServer(ToServer.joinArena());
  }

  void leaveArena() {
    _wsRepository.toServer(ToServer.leaveArena());
  }

  void createEdict() {
    _wsRepository.toServer(ToServer.createNewEdict());
  }

  void joinEdict(int userId) {
    _wsRepository.toServer(ToServer.createNewEdict());
  }

  void leaveEdict() {
    _wsRepository.toServer(ToServer.leaveEdict());
  }
}

@freezed
abstract class ArenaBoardState with _$ArenaBoardState {
  const ArenaBoardState._();
  const factory ArenaBoardState({required List<EdictDto> edicts}) =
      _ArenaBoardState;
}
