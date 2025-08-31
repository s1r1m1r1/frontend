// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/auth/logic/login_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/router/routes.dart';
import '../../../../inject/get_it.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (_) => getIt<LoginNotifier>(),
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

  late LoginNotifier _loginNtf;

  @override
  void initState() {
    super.initState();
    _loginNtf = context.read<LoginNotifier>();
    debugPrint('$red ADD LISTEN  ${_loginNtf.value} $reset');
    _loginNtf.addListener(_listenNotifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listenNotifier();
    });
  }

  void _listenNotifier() {
    debugPrint('$red on LISTEN ${_loginNtf.value.runtimeType} $reset');
    if (_loginNtf.value is LoginFailure) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Failed: ')));
    }
    if (_loginNtf.value is LoginSuccess) {
      PendingRoute().go(context);
    }
  }

  @override
  void dispose() {
    _loginNtf.removeListener(_listenNotifier);
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                            onPressed: () async {
                              _usernameController.text = 'qq@qq.qq';
                              _passwordController.text = '12qwAS';
                              debugPrint('$red on Pressed 1 $reset');
                              await _login();
                            },
                            child: Text('qq'),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextButton(
                            onPressed: () async {
                              _usernameController.text = 'ww@ww.ww';
                              _passwordController.text = '12qwAS';
                              debugPrint('$red on Pressed 1 $reset');
                              await _login();
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
                Consumer<LoginNotifier>(
                  builder: (context, ntf, _) {
                    if (ntf.value is LoginLoading) {
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
        ],
      ),
    );
  }

  Future<void> _login() async {
    debugPrint('$red on Pressed $reset');
    await _loginNtf
        .loginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        )
        .onError((e, s) {
          debugPrint('$red on Pressed ERROR {$e} $reset');
        });
  }
}
