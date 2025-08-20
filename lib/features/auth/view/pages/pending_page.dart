import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/logic/auth_cubit.dart';
import 'package:frontend/features/unit/logic/selected_unit.bloc.dart';
import 'package:frontend/inject/get_it.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthCubit>()..subscribe()),
        BlocProvider(
          create: (_) =>
              getIt<SelectedUnitBloc>()..add(SelectedUnitEvent.load()),
        ),
      ],
      child: _PendingView(),
    );
  }
}

class _PendingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('PendingPage build');
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        switch (state) {
          case InitialAuthState():
          case LogoutAuthState():
            break;
          case AuthenticatedAuthState(:final session):
            switch (session) {
              case PendingSession():
                unawaited(context.read<AuthCubit>().updateSession(session));
                break;
              case WelcomeSession():
                UnitRoute().go(context);
              case GameReadySession():
                WsConnectingRoute().go(context);
              case GameJoinedSession(:final gameOption):
                MenuRoute(gameOption.mainRoomId).go(context);
              case GameFinishedSession():
                break;
            }
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 40),
            Text('Pending Page'),
            Spacer(),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Center(child: Text(state.toString()));
              },
            ),
            SizedBox(height: 32),
            BlocBuilder<SelectedUnitBloc, SelectedUnitState>(
              builder: (context, state) {
                return Center(child: Text('unitId: //${state.unitId}'));
              },
            ),
            SizedBox(height: 32),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
