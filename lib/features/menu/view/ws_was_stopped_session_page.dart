import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/inject/get_it.dart';

class WsStoppedSessionPage extends StatelessWidget {
  const WsStoppedSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _WsStoppedSessionView();
  }
}

class _WsStoppedSessionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              Spacer(),
              Text(
                'Your session was stopped because another device logged in with your account.',
              ),
              SizedBox(height: 10),
              Text('Please re-login if you wish to continue.'),
              TextButton(
                child: const Text('Re-login'),
                onPressed: () {
                  // context.read<LogoutCubit>().logout();
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
