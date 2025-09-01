import 'package:flutter/material.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/unit/logic/selected_unit_notifier.dart';
import 'package:frontend/features/unit/view/selected_unit_page.dart';
import 'package:provider/provider.dart';

import '../../../inject/get_it.dart';
import '../logic/unit_notifier.dart';

class UnitPage extends StatelessWidget {
  const UnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt.get<UnitNotifier>()..read(),
        ),
        ChangeNotifierProvider.value(
          value: getIt<SelectedUnitNotifier>()..load(),
        ),
      ],
      child: _UnitView(),
    );
  }
}

class _UnitView extends StatelessWidget {
  const _UnitView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UnitNotifier>(
        builder: (context, ntf, _) {
          final state = ntf.value;
          if (state.status == UnitStateStatus.success) {
            if (state.units.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                CreateUnitRoute().pushReplacement(context);
              });
            }
          }

          switch (state.status) {
            case UnitStateStatus.initial:
              return const Center(child: Text('Initial'));
            case UnitStateStatus.loading:
              return const Center(child: Text('Loading'));
            case UnitStateStatus.empty:
              return const Center(child: Text('Create character'));
            case UnitStateStatus.success:
              return SelectedUnitView();
            case UnitStateStatus.failure:
              return const Center(child: Text('Failure'));
          }
        },
      ),
    );
  }
}
