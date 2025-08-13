import 'package:flutter/material.dart';
import 'package:frontend/features/auth/view/pages/login_page.dart';
import 'package:frontend/features/unit/view/crate_unit_page.dart';
import 'package:frontend/features/todo/view/page/todo_list_screen.dart';
import 'package:frontend/features/ws_counter/view/page/ws_counter_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/view/admin_page.dart';
import '../../features/auth/view/pages/pending_page.dart';
import '../../features/auth/view/pages/signup_page.dart';
import '../../features/letters/view/letters_page.dart';
import '../../features/menu/view/menu_page.dart';
import '../../features/screens/home_screen.dart';
import '../../features/unit/view/selected_unit_page.dart';
import '../../features/unit/view/unit_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();
  static const path = '/home';

  @override
  Widget build(_, _) => const HomeScreen();
}

@TypedGoRoute<PendingRoute>(path: PendingRoute.path)
class PendingRoute extends GoRouteData with _$PendingRoute {
  static const path = '/pending';
  const PendingRoute();

  @override
  Widget build(_, _) => PendingPage();
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData with _$LoginRoute {
  static const path = '/login';
  const LoginRoute();

  @override
  Widget build(_, _) => LoginPage();
}

@TypedGoRoute<SignupRoute>(path: SignupRoute.path)
class SignupRoute extends GoRouteData with _$SignupRoute {
  static const path = '/signup';
  const SignupRoute();

  @override
  Widget build(_, _) => SignupPage();
}

@TypedGoRoute<TodoListRoute>(path: TodoListRoute.path)
class TodoListRoute extends GoRouteData with _$TodoListRoute {
  static const path = '/todo-list';
  const TodoListRoute();

  @override
  Widget build(_, _) => TodoListScreen();
}

@TypedGoRoute<WSCounterRoute>(path: WSCounterRoute.path)
class WSCounterRoute extends GoRouteData with _$WSCounterRoute {
  static const path = '/ws-counter';
  const WSCounterRoute();

  @override
  Widget build(_, _) => CounterPage();
}

@TypedGoRoute<LettersRoute>(path: LettersRoute.path)
class LettersRoute extends GoRouteData with _$LettersRoute {
  static const path = '/letters';
  const LettersRoute();

  @override
  Widget build(_, _) => LettersPage();
}

@TypedGoRoute<AdminRoute>(path: AdminRoute.path)
class AdminRoute extends GoRouteData with _$AdminRoute {
  static const path = '/admin';
  const AdminRoute();

  @override
  Widget build(_, _) => AdminPage();
}

@TypedGoRoute<MenuRoute>(path: MenuRoute.path)
class MenuRoute extends GoRouteData with _$MenuRoute {
  static const path = '/menu';
  const MenuRoute();

  @override
  Widget build(_, _) => MenuPage();
}

@TypedGoRoute<CreateUnitRoute>(path: CreateUnitRoute.path)
class CreateUnitRoute extends GoRouteData with _$CreateUnitRoute {
  static const path = '/create-unit';
  const CreateUnitRoute();

  @override
  Widget build(_, _) => CreateUnitPage();
}

@TypedGoRoute<UnitRoute>(path: UnitRoute.path)
class UnitRoute extends GoRouteData with _$UnitRoute {
  static const path = '/unit';
  const UnitRoute();

  @override
  Widget build(_, _) => UnitPage();
}
