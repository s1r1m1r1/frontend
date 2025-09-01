// lib/screens/signup_screen.dart
import 'package:flutter/material.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/auth/logic/signup_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../inject/get_it.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<SignupNotifier>(),
      child: const _SignupView(),
    );
  }
}

class _SignupView extends StatefulWidget {
  const _SignupView();

  @override
  State<_SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<_SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late SignupNotifier _loginNtf;

  @override
  void initState() {
    super.initState();
    _loginNtf = context.read<SignupNotifier>();
    debugPrint('$red ADD LISTEN  ${_loginNtf.value} $reset');
    _loginNtf.addListener(_listenNotifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listenNotifier();
    });
  }

  void _listenNotifier() {
    debugPrint('$red on LISTEN ${_loginNtf.value.runtimeType} $reset');
    if (_loginNtf.value is SignupFailure) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Failed: ')));
    }
    if (_loginNtf.value is SignupSuccess) {
      PendingRoute().go(context);
    }
  }

  @override
  void dispose() {
    _loginNtf.removeListener(_listenNotifier);
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Consumer<SignupNotifier>(
              builder: (context, ntf, _) {
                final state = ntf.value;
                if (state is SignupLoading) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    context.read<SignupNotifier>().signupPressed(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  },
                  child: const Text('Sign Up'),
                );
              },
            ),

            TextButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(LoginRoute.path);
                // Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text('Already have an account? Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
