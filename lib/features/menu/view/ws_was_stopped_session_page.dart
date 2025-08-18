import 'package:flutter/material.dart';

class WsStoppedSessionPage extends StatelessWidget {
  const WsStoppedSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Your session was stopped because another device logged in with your account.',
          ),
          SizedBox(height: 10),
          Text('Please re-login if you wish to continue.'),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
        ],
      ),
    );
  }
}
