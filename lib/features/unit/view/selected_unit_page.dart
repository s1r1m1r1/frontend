import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/router/user_routes.dart';
import 'package:frontend/features/unit/logic/selected_unit.bloc.dart';

import '../domain/unit.dart';
import '../logic/unit_bloc.dart';

class SelectedUnitView extends StatelessWidget {
  const SelectedUnitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedUnitBloc, SelectedUnitState>(
      builder: (context, selectedState) {
        return BlocBuilder<UnitBloc, UnitState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    itemCount: state.units.length,
                    itemBuilder: (context, index) {
                      final unit = state.units[index];
                      final isSelected = selectedState.unitId == unit.id;
                      return GestureDetector(
                        onTap: () {
                          context.read<SelectedUnitBloc>().add(
                            SelectedUnitEvent.select(unit.id),
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: _SelectedUnitItem(
                                unit,
                                isSelected: isSelected,
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Center(
                                child: isSelected ? Icon(Icons.done) : null,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                      onPressed: selectedState.unitId != -1
                          ? () {
                              PendingRoute().go(context);
                            }
                          : null,
                      child: Text('continue'),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _SelectedUnitItem extends StatelessWidget {
  final Unit unit;
  final bool isSelected;
  const _SelectedUnitItem(this.unit, {required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          Text(unit.name),
          Text('Level: 1'),
          Text('Class: unimplemented'),
          Text('atk: ${unit.atk}'),
          Text('def: ${unit.def}'),
          Text('vitality: ${unit.vitality}'),
        ],
      ),
    );
  }
}
