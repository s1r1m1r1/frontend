import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/view/admin_page.dart';

part 'admin_routes.g.dart';

@TypedGoRoute<AdminRoute>(path: AdminRoute.path)
class AdminRoute extends GoRouteData with _$AdminRoute {
  static const path = '/admin';
  const AdminRoute();

  @override
  Widget build(_, _) => AdminPage();
}
