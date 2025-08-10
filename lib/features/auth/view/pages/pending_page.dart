import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/logic/with_token/http_with_token_bloc.dart';

import '../../../../inject/get_it.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<HttpWithTokenBloc>()..add(const SubscribeEvent()), child: _PendingView());
  }
}

class _PendingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HttpWithTokenBloc, WithTokenStatus>(
        builder: (context, status) {
          final text = switch (status) {
            WithTokenStatus.initial => '...',
            WithTokenStatus.hasToken => '..wait',
            WithTokenStatus.joinWithToken => '..connecting',
            WithTokenStatus.hasRefresh => '...wait',
            WithTokenStatus.joinWithRefresh => '...connecting',
            WithTokenStatus.authorized => '...done',
            WithTokenStatus.unauthorized => '...denied',
          };
          return Center(child: Text(text));
        },
      ),
    );
  }
}
