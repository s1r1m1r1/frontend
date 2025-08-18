import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/user/logic/app_stage.bloc.dart';
import 'package:frontend/inject/get_it.dart';

class PendingStagePage extends StatelessWidget {
  const PendingStagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppStageBloc>(),
      child: Scaffold(body: Center(child: Text('Pending...'))),
    );
  }
}

class _PendingStageView extends StatelessWidget {
  const _PendingStageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Pending...')));
  }
}
