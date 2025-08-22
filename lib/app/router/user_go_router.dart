import 'package:frontend/app/router/user_routes.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/logic/auth_cubit.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:go_router/go_router.dart';

GoRouter get getUserRouter {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
    initialLocation: PendingRoute.path,
    refreshListenable: getIt<AuthCubit>(),
    redirect: (context, state) {
      final path = state.uri.path;
      final authState = getIt<AuthCubit>().state;
      switch (authState) {
        case InitialAuthState():
          break;
        case AuthenticatedAuthState(:final session):
          switch (session) {
            case PendingSession():
              return PendingRoute.path;

            case WelcomeSession():
            case GameReadySession():
            case GameJoinedSession():
              return null;

            case GameFinishedSession():
              return WsStoppedSessionRoute.path;
          }

        case LogoutAuthState():
          if (path != LoginRoute.path && path != SignupRoute.path) {
            return LoginRoute.path;
          }
      }

      return null;
    },
  );
}
