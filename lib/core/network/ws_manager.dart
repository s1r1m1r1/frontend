import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'package:sha_red/sha_red.dart';

enum WsConnectionStatus {
  initial,
  connecting,
  connected,
  disconnecting,
  disconnected,
  reconnecting,
  reconnected,
}

@lazySingleton
class WsManager {
  final WsRepository _wsRepository;
  late WebSocket _ws;
  WsManager(this._wsRepository) {
    init();
  }
  StreamSubscription? _sub, _sub2, _sub3;

  void init() {
    _ws = getIt<WebSocket>();
    // _authRepository.wsSend = send;
    _sub?.cancel();
    _sub2?.cancel();
    _sub3?.cancel();
    _listenData();
    _listenStatus();
    _listenToServer();
  }

  /// Send an increment message to the server.
  void send(dynamic data) {
    _ws.send(data);
  }

  final _statusSbj = BehaviorSubject<WsConnectionStatus>.seeded(
    WsConnectionStatus.initial,
  );

  /// this is  Steam
  Stream<WsConnectionStatus> get connection => _statusSbj.stream;

  void restart() {
    _ws.close();
    init();
  }

  void _listenData() {
    _sub = _ws.messages.listen(
      (rawData) async {
        try {
          final decoded = jsonDecode(rawData);

          final freezed = ToClient.fromJson(decoded as Json);
          _wsRepository.toClient(freezed);
        } catch (e) {
          debugPrint('$green [WsManager] error $e $reset');
        }
      },
      onDone: () {
        // called after channel.close();
        debugPrint('$red [WsManager] connectionClosed $reset');
      },

      cancelOnError: true,
    );
  }

  void _listenStatus() {
    _sub = _ws.connection.listen((state) {
      final status = switch (state) {
        Connecting() => WsConnectionStatus.connecting,
        Connected() => WsConnectionStatus.connected,
        Reconnecting() => WsConnectionStatus.reconnecting,
        Reconnected() => WsConnectionStatus.reconnected,
        Disconnecting() => WsConnectionStatus.disconnecting,
        Disconnected() => WsConnectionStatus.disconnecting,
      };
      _statusSbj.add(status);
    });
  }

  void _listenToServer() {
    _sub3 = _wsRepository.toServerStream.listen((event) {
      send.call(event.encoded());
    });
  }

  @disposeMethod
  void dispose() {
    _sub?.cancel();
    _sub?.cancel();
    _statusSbj.close();
    _ws.close();
  }
}

typedef WsCallback = void Function(dynamic data);
