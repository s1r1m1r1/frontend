import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/logic/session.bloc.dart';
import 'package:frontend/features/menu/logic/ws_connection_cubit.dart';
import 'package:frontend/inject/get_it.dart';

class WsConnectingPage extends StatelessWidget {
  const WsConnectingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<WsConnectionCubit>()..listenConnection(),
        ),
        BlocProvider.value(value: getIt<SessionBloc>()),
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
            final token = context
                .read<SessionBloc>()
                .state
                .session
                ?.accessToken;
            if (token != null) {
              context.read<SessionBloc>().add(SessionEvent.joinWs(token));
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

            BlocBuilder<SessionBloc, SessionState>(
              builder: (context, state) {
                return Center(child: Text('... $state'));
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
