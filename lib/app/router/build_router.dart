import 'package:flutter/material.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:go_router/go_router.dart';

GoRouter buildRouter(BuildContext context) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
    initialLocation: PendingRoute.path,
    refreshListenable: getIt<AuthRepository>().sessionNtf,
    redirect: (context, state) {
      final path = state.uri.path;
      final session = getIt<AuthRepository>().sessionNtf.value;
      switch (session) {
        case null:
          if (path != LoginRoute.path && path != SignupRoute.path) {
            return LoginRoute.path;
          }
        case PendingSession():
          return PendingRoute.path;

        case WelcomeSession():
        case GameReadySession():
        case GameJoinedSession():
          return null;

        case GameFinishedSession():
          return WsStoppedSessionRoute.path;
      }
      return null;
    },
  );
}
