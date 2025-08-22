// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$adminRoute];

RouteBase get $adminRoute =>
    GoRouteData.$route(path: '/admin', factory: _$AdminRoute._fromState);

mixin _$AdminRoute on GoRouteData {
  static AdminRoute _fromState(GoRouterState state) => const AdminRoute();

  @override
  String get location => GoRouteData.$location('/admin');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
