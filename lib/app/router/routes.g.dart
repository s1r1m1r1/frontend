// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $pendingRoute,
  $loginRoute,
  $signupRoute,
  $wsConnectingRoute,
  $wsStoppedSessionRoute,
  $todoListRoute,
  $adminRoute,
  $menuRoute,
  $createUnitRoute,
  $unitRoute,
];

RouteBase get $pendingRoute =>
    GoRouteData.$route(path: '/pending', factory: _$PendingRoute._fromState);

mixin _$PendingRoute on GoRouteData {
  static PendingRoute _fromState(GoRouterState state) => const PendingRoute();

  @override
  String get location => GoRouteData.$location('/pending');

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

RouteBase get $loginRoute =>
    GoRouteData.$route(path: '/login', factory: _$LoginRoute._fromState);

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

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

RouteBase get $signupRoute =>
    GoRouteData.$route(path: '/signup', factory: _$SignupRoute._fromState);

mixin _$SignupRoute on GoRouteData {
  static SignupRoute _fromState(GoRouterState state) => const SignupRoute();

  @override
  String get location => GoRouteData.$location('/signup');

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

RouteBase get $wsConnectingRoute => GoRouteData.$route(
  path: '/ws-connecting',
  factory: _$WsConnectingRoute._fromState,
);

mixin _$WsConnectingRoute on GoRouteData {
  static WsConnectingRoute _fromState(GoRouterState state) =>
      const WsConnectingRoute();

  @override
  String get location => GoRouteData.$location('/ws-connecting');

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

RouteBase get $wsStoppedSessionRoute => GoRouteData.$route(
  path: '/ws-stopped-session',
  factory: _$WsStoppedSessionRoute._fromState,
);

mixin _$WsStoppedSessionRoute on GoRouteData {
  static WsStoppedSessionRoute _fromState(GoRouterState state) =>
      const WsStoppedSessionRoute();

  @override
  String get location => GoRouteData.$location('/ws-stopped-session');

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

RouteBase get $todoListRoute =>
    GoRouteData.$route(path: '/todo-list', factory: _$TodoListRoute._fromState);

mixin _$TodoListRoute on GoRouteData {
  static TodoListRoute _fromState(GoRouterState state) => const TodoListRoute();

  @override
  String get location => GoRouteData.$location('/todo-list');

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

RouteBase get $menuRoute =>
    GoRouteData.$route(path: '/menu', factory: _$MenuRoute._fromState);

mixin _$MenuRoute on GoRouteData {
  static MenuRoute _fromState(GoRouterState state) => const MenuRoute();

  @override
  String get location => GoRouteData.$location('/menu');

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

RouteBase get $createUnitRoute => GoRouteData.$route(
  path: '/create-unit',
  factory: _$CreateUnitRoute._fromState,
);

mixin _$CreateUnitRoute on GoRouteData {
  static CreateUnitRoute _fromState(GoRouterState state) =>
      const CreateUnitRoute();

  @override
  String get location => GoRouteData.$location('/create-unit');

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

RouteBase get $unitRoute =>
    GoRouteData.$route(path: '/unit', factory: _$UnitRoute._fromState);

mixin _$UnitRoute on GoRouteData {
  static UnitRoute _fromState(GoRouterState state) => const UnitRoute();

  @override
  String get location => GoRouteData.$location('/unit');

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
