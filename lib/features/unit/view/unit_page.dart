import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/router/routes.dart';
import 'package:frontend/features/unit/logic/selected_unit.bloc.dart';
import 'package:frontend/features/unit/view/selected_unit_page.dart';

import '../../../inject/get_it.dart';
import '../logic/unit_bloc.dart';

class UnitPage extends StatelessWidget {
  const UnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<UnitBloc>()..add(UnitEvent.readUnit()),
        ),
        BlocProvider.value(
          value: getIt<SelectedUnitBloc>()..add(SelectedUnitEvent.load()),
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
      body: BlocConsumer<UnitBloc, UnitState>(
        listener: (BuildContext context, UnitState state) {
          if (state.status == UnitStateStatus.success) {
            if (state.units.isEmpty) {
              CreateUnitRoute().pushReplacement(context);
            }
          }
        },
        builder: (context, state) {
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
