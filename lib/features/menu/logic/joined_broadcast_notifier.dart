import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';

import '../../../core/network/ws_repository.dart';
part 'joined_broadcast_notifier.freezed.dart';

@injectable
class BroadcastInfoNotifier extends LogNotifier<JoinedBroadcastState> {
  final WsRepository _wsRepository;
  BroadcastInfoNotifier(this._wsRepository) : super(JoinedBroadcastState([]));

  StreamSubscription? _sub;
  void subscribe() {
    _sub?.cancel();
    _sub = _wsRepository.toClientStream.whereType<BroadcastTC>().listen((
      event,
    ) {
      switch (event) {
        case BroadcastInfoTC(:final broads):
          value = JoinedBroadcastState(broads);
        case TerminatedBroadcastTC(:final broad):
          final updated = List.of(value.joinedBroads)..remove(broad);
          value = JoinedBroadcastState(updated);
        case TerminatedAllBroadcastTC():
          value = JoinedBroadcastState([]);
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  void fetchBroads() {
    _wsRepository.toServer(ToServer.getJoinedBroads());
  }
}

@freezed
abstract class JoinedBroadcastState with _$JoinedBroadcastState {
  const factory JoinedBroadcastState(List<BroadcastId> joinedBroads) =
      _JoinedBroadcastState;
}
