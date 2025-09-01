import 'package:flutter/material.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/logic/session_notifier.dart';
import 'package:frontend/features/menu/logic/ws_connection_notifier.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:provider/provider.dart';

import '../../auth/logic/token_notifier.dart';

class WsConnectingPage extends StatelessWidget {
  const WsConnectingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => getIt<TokenNotifier>()..subscribe(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<WsConnectionNotifier>()..listenConnection(),
        ),
        ChangeNotifierProvider.value(value: getIt<SessionNotifier>()),
      ],
      child: _WsConnectingView(),
    );
  }
}

class _WsConnectingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Consumer<WsConnectionNotifier>(
            builder: (context, ntf, _) {
              if (ntf.value == WsConnectionStatus.connected) {
                final token = context.read<TokenNotifier>().value.token;
                if (token != null) {
                  context.read<SessionNotifier>().joinWs(token);
                }
              }
              return Center(child: Text('... ${ntf.value.name}'));
            },
          ),
          Consumer<SessionNotifier>(
            builder: (context, ntf, _) {
              return Center(child: Text('... ${ntf.value}'));
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
