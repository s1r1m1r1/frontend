import 'package:frontend/app/router/admin_routes.dart';
import 'package:frontend/app/router/user_routes.dart' as userRoutes;
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/logic/auth_cubit.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:go_router/go_router.dart';

GoRouter get getAdminRouter {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: [...$appRoutes, ...userRoutes.$appRoutes],
    initialLocation: AdminRoute.path,
    refreshListenable: getIt<AuthCubit>(),
    redirect: (context, state) {
      final path = state.uri.path;
      final session = getIt<AuthCubit>();
      return null;
    },
  );
}
