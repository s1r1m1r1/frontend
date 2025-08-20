import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/auth/logic/auth_cubit.dart';
import 'package:frontend/features/menu/logic/ws_connection_cubit.dart';
import 'package:frontend/features/menu/logic/ws_join_cubit.dart';
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
        BlocProvider(create: (_) => getIt<WsJoinCubit>()..subscribe()),
        BlocProvider(create: (_) => getIt<AuthCubit>()..subscribe()),
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
          case WsConnectionStatus.init:
          case WsConnectionStatus.connecting:
            break;
          case WsConnectionStatus.reconnecting:
          case WsConnectionStatus.reconnected:
            break;
          case WsConnectionStatus.connected:
            context.read<WsJoinCubit>().wsJoin();
          case WsConnectionStatus.disconnecting:
          case WsConnectionStatus.disconnected:
            break;
        }
      },
      child: BlocListener<WsJoinCubit, WsJoinState>(
        listener: (context, state) {
          switch (state) {
            case InitialWsJoin():
            case ConnectingWsJoin():
              break;
            case ConnectedWsJoin(:final roomId):
              MenuRoute(roomId).go(context);
              break;
            case DisconnectedWsJoin():
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
              BlocBuilder<WsJoinCubit, WsJoinState>(
                builder: (context, state) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('... $state'),
                        TextButton(
                          child: Text('press'),
                          onPressed: () {
                            context.read<WsJoinCubit>().wsJoin();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Center(child: Text('... $state'));
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
