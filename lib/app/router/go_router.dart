import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/logic/session_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter goRouter(BuildContext context) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
    initialLocation: PendingRoute.path,
    refreshListenable: context.read<SessionNotifier>(),
    redirect: (context, state) {
      final path = state.uri.path;
      final session = context.read<SessionNotifier>().value;
      switch (session) {
        case LogoutSession():
          if (path != LoginRoute.path &&
              path != SignupRoute.path &&
              path != PendingRoute.path) {
            debugPrint('$yellow Redirect 4  $reset');
            return LoginRoute.path;
          }

        case InitialSession():
        case PendingSession():
          return PendingRoute.path;
        case WelcomeSession():
          break;
        case WsSession(
          status: WSSessionStatus.disconnectedByAnother ||
              WSSessionStatus.disconnected,
        ):
          return WsStoppedSessionRoute.path;
        case WsSession():
          return null;
      }

      return null;
    },
  );
}
