import 'package:frontend/app/router/routes.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter() {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
    initialLocation: PendingRoute.path,
    // refreshListenable: getIt<AuthNotifier>()..subscribe(),
    redirect: (context, state) {
      final path = state.uri.path;
      // final value = getIt<AuthNotifier>().value;
      // debugPrint('$yellow Redirect state: $value $reset');
      // switch (value) {
      //   case null:
      //     if (path != LoginRoute.path && path != SignupRoute.path) {
      //       debugPrint('$yellow Redirect 4  $reset');
      //       return LoginRoute.path;
      //     }
      //   case PendingSession():
      //     return PendingRoute.path;
      //   case WelcomeSession():
      //   case GameReadySession():
      //   case GameJoinedSession():
      //     return null;
      //   case GameFinishedSession():
      //     return WsStoppedSessionRoute.path;
      // }

      return null;
    },
  );
}
