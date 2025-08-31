import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/logic/session_notifier.dart';
import 'package:frontend/features/menu/logic/ws_connection_cubit.dart';
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
        BlocProvider(
          create: (_) => getIt<WsConnectionCubit>()..listenConnection(),
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
    return BlocListener<WsConnectionCubit, WsConnectionStatus>(
      listener: (context, status) {
        switch (status) {
          case WsConnectionStatus.initial:
          case WsConnectionStatus.connecting:
            break;
          case WsConnectionStatus.reconnecting:
          case WsConnectionStatus.reconnected:
            break;
          case WsConnectionStatus.connected:
            final token = context.read<TokenNotifier>().value.token;
            debugPrint('token: $token');
            if (token != null) {
              context.read<SessionNotifier>().joinWs(token);
            }
          case WsConnectionStatus.disconnecting:
          case WsConnectionStatus.disconnected:
            break;
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Spacer(),
            BlocBuilder<WsConnectionCubit, WsConnectionStatus>(
              builder: (context, state) {
                return Center(child: Text('... ${state.name}'));
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
      ),
    );
  }
}
