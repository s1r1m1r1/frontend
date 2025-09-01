import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:frontend/features/unit/domain/unit.dart';
import 'package:frontend/features/unit/domain/unit_repository.dart';
import 'package:injectable/injectable.dart';

part 'selected_unit_notifier.freezed.dart';

@injectable
class SelectedUnitNotifier extends LogNotifier<SelectedUnitState> {
  final UnitRepository _repository;
  SelectedUnitNotifier(this._repository) : super(SelectedUnitState.initial());

  FutureOr<void> load() async {
    try {
      final selectedUnit = _repository.selectedUnitNtf.value;
      if (selectedUnit != null) {
        value = SelectedUnitState.success(selectedUnit);
        return;
      }

      final unit = await _repository.fetchSelectedUnit();
      if (unit == null) {
        value = SelectedUnitState.notSelected();
        return;
      }
      value = SelectedUnitState.success(unit);
    } on Object catch (e, s) {
      addError(e, s);
      value = SelectedUnitState.failure();
    }
  }

  FutureOr<void> selectPressed(int unitId) async {
    try {
      final unit = await _repository.setSelectedUnit(unitId);
      if (unit == null) {
        value = SelectedUnitState.notSelected();
        return;
      }
      value = SelectedUnitState.success(unit);
    } catch (e, s) {
      addError(e, s);
      value = SelectedUnitState.failure();
    }
  }
}

@freezed
sealed class SelectedUnitState with _$SelectedUnitState {
  const SelectedUnitState._();

  const factory SelectedUnitState.initial() = Initial_US;
  const factory SelectedUnitState.loading() = Loading_US;
  const factory SelectedUnitState.success(Unit unit) = Success_US;
  const factory SelectedUnitState.notSelected() = NotSelected_US;
  const factory SelectedUnitState.failure() = Failure_US;

  int get unitId => switch (this) {
    Success_US(:final unit) => unit.id,
    _ => -1,
  };
}
