part of 'selected_unit.bloc.dart';

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
