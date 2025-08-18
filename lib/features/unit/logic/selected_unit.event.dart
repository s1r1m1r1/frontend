part of 'selected_unit.bloc.dart';

@freezed
abstract class SelectedUnitEvent with _$SelectedUnitEvent {
  const factory SelectedUnitEvent.load() = _Load;
  const factory SelectedUnitEvent.select(int unitId) = _SelectPressed;
}
