import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:injectable/injectable.dart';

@injectable
class WsConnectionCubit extends Cubit<WsConnectionStatus> {
  final WsManager _ws;
  WsConnectionCubit(this._ws) : super(WsConnectionStatus.initial);
  StreamSubscription? _sub;

  void refresh() {
    final s = state;
    emit(WsConnectionStatus.initial);
    emit(s);
  }

  void listenConnection() {
    _sub = _ws.connection.listen((state) {
      emit(state);
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
