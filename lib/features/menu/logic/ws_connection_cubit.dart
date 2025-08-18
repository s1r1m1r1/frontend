import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_client/web_socket_client.dart';

enum WsConnectionStatus {
  init,
  connecting,
  reconnecting,
  reconnected,
  connected,
  disconnecting,
  disconnected,
}

@injectable
class WsConnectionCubit extends Cubit<WsConnectionStatus> {
  final WsManager _ws;
  WsConnectionCubit(this._ws) : super(WsConnectionStatus.init);
  StreamSubscription? _sub;

  void refresh() {
    final s = state;
    emit(WsConnectionStatus.init);
    emit(s);
  }

  void listenConnection() {
    _sub = _ws.connection.listen((state) {
      final status = switch (state) {
        Connecting() => WsConnectionStatus.connecting,
        Connected() => WsConnectionStatus.connected,
        Reconnecting() => WsConnectionStatus.reconnecting,
        Reconnected() => WsConnectionStatus.reconnected,
        Disconnecting() => WsConnectionStatus.disconnecting,
        Disconnected() => WsConnectionStatus.disconnected,
      };
      emit(status);
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
