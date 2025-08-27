// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/logic/login.cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/user_routes.dart';
import '../../../../inject/get_it.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login Failed: ${state.error}')),
                  );
                }
                if (state is LoginSuccess) {
                  PendingRoute($extra: state.session).go(context);
                }
              },
              child: Column(
                children: [
                  // if(kDebugMode)
                  SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextButton(
                              onPressed: () {
                                _usernameController.text = 'qq@qq.qq';
                                _passwordController.text = '12qwAS';
                                _login();
                              },
                              child: Text('qq'),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: TextButton(
                              onPressed: () {
                                _usernameController.text = 'ww@ww.ww';
                                _passwordController.text = '12qwAS';
                                _login();
                              },
                              child: Text('ww'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        child: const Text('Login'),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(SignupRoute.path);
                      // Navigator.of(context).pushNamed('/signup');
                    },
                    child: const Text('Don\'t have an account? Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login() {
    BlocProvider.of<LoginCubit>(context).loginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
