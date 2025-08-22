import 'package:frontend/app/router/admin_go_router.dart';
import 'package:frontend/app/router/user_go_router.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GoRouterModule {
  @Named('user')
  @injectable
  GoRouter get buildUserRouter => getUserRouter;

  @Named('admin')
  @injectable
  GoRouter get buildAdminRouter => getAdminRouter;
}
