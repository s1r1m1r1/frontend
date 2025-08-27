import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/router/user_routes.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/logic/session.bloc.dart';
import 'package:frontend/features/unit/logic/selected_unit.bloc.dart';
import 'package:frontend/inject/get_it.dart';

class PendingPage extends StatelessWidget {
  final Session? session;
  const PendingPage({super.key, this.session});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<SessionBloc>()..add(SessionEvent.setSession(session)),
        ),
        BlocProvider(
          create: (_) =>
              getIt<SelectedUnitBloc>()..add(SelectedUnitEvent.load()),
        ),
      ],
      child: _PendingView(),
    );
  }
}

class _PendingView extends StatefulWidget {
  @override
  State<_PendingView> createState() => _PendingViewState();
}

class _PendingViewState extends State<_PendingView> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<SessionBloc>();
    _sub = bloc.stream.listen(_onState);
    _onState(bloc.state);
  }

  StreamSubscription? _sub;
  void _onState(SessionState state) {
    switch (state.session) {
      case null:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          LoginRoute().go(context);
        });
        break;
      case PendingSession():
        break;
      case WelcomeSession():
        // fix trouble with initial context
        WidgetsBinding.instance.addPostFrameCallback((_) {
          UnitRoute().go(context);
        });
      case GameReadySession():
        WidgetsBinding.instance.addPostFrameCallback((_) {
          WsConnectingRoute().go(context);
        });
      case GameJoinedSession(:final gameOption, :final unit):
        WidgetsBinding.instance.addPostFrameCallback((_) {
          MenuRoute(
            roomId: gameOption.mainRoomId,
            senderId: unit.id,
          ).go(context);
        });

      case GameFinishedSession():
        break;
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('PendingPage build');
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Text('Pending Page'),
          Spacer(),
          BlocBuilder<SessionBloc, SessionState>(
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
    );
  }
}
