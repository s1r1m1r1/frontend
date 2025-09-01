import 'dart:async';

import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:injectable/injectable.dart';

@injectable
class WsConnectionNotifier extends LogNotifier<WsConnectionStatus> {
  final WsManager _ws;
  WsConnectionNotifier(this._ws) : super(WsConnectionStatus.initial);
  StreamSubscription? _sub;

  void refresh() {
    notifyListeners();
  }

  void listenConnection() {
    _sub = _ws.connection.listen((state) {
      value = state;
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    return super.dispose();
  }
}
