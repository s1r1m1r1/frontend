import 'package:flutter/material.dart';
import 'package:frontend/features/auth/logic/session_notifier.dart';
import 'package:frontend/features/auth/logic/token_notifier.dart';
import 'package:provider/provider.dart';

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
                child: Text('Re-login'),
                onPressed: () async {
                  await context.read<SessionNotifier>().logout();
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
