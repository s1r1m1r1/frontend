import 'package:flutter/material.dart';

class ArenaPage extends StatelessWidget {
  const ArenaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _ArenaView();
  }
}

class _ArenaView extends StatelessWidget {
  const _ArenaView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Arena')));
  }
}
