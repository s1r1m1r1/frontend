import 'package:flutter/material.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:frontend/features/auth/logic/session_notifier.dart';
import 'package:frontend/features/unit/logic/selected_unit_notifier.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:provider/provider.dart';

class PendingPage extends StatelessWidget {
  final Session? session;
  const PendingPage({super.key, this.session});

  @override
  Widget build(BuildContext context) {
    // debugPrint('PendingPage build');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: getIt<SessionNotifier>()..readSession(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<SelectedUnitNotifier>()..load(),
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
  late SessionNotifier _ntf;
  @override
  void initState() {
    super.initState();
    _ntf = context.read<SessionNotifier>();
    _ntf.addListener(_onState);
  }

  void _onState() {
    final session = _ntf.value;

    switch (session) {
      case LogoutSession():
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
      case WsSession(status: WSSessionStatus.ready):
        WidgetsBinding.instance.addPostFrameCallback((_) {
          WsConnectingRoute().go(context);
        });
      case WsSession(
        status: WSSessionStatus.connected,
        gameOption: WsGameOption(:final mainRoomId),
      ):
        debugPrint('GAME READY go ws');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          MenuRoute(roomId: mainRoomId, senderId: session.unit.id).go(context);
        });

      default:
        break;
    }
  }

  @override
  void dispose() {
    _ntf.removeListener(_onState);
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
          Consumer<SessionNotifier>(
            builder: (context, ntf, _) {
              return Center(child: Text(ntf.value.toString()));
            },
          ),

          SizedBox(height: 32),
          Consumer<SelectedUnitNotifier>(
            builder: (context, ntf, _) {
              return Center(child: Text('unitId: //${ntf.value.unitId}'));
            },
          ),
          SizedBox(height: 32),

          Spacer(),
        ],
      ),
    );
  }
}
