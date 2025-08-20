
import 'package:flutter/material.dart';

class EmailPendingPage extends StatelessWidget {
  const EmailPendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Confirmation Pending'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A confirmation email has been sent to your email address.'),
            SizedBox(height: 16),
            Text('Please check your inbox and click the confirmation link to continue.'),
          ],
        ),
      ),
    );
  }
}
