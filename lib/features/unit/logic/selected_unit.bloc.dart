import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/unit/domain/unit.dart';
import 'package:frontend/features/unit/domain/unit_repository.dart';
import 'package:injectable/injectable.dart';

part 'selected_unit.state.dart';
part 'selected_unit.event.dart';
part 'selected_unit.bloc.freezed.dart';

@injectable
class SelectedUnitBloc extends Bloc<SelectedUnitEvent, SelectedUnitState> {
  final UnitRepository _repository;
  SelectedUnitBloc(this._repository) : super(SelectedUnitState.initial()) {
    on<_Load>(_onLoad);
    on<_SelectPressed>(_onSelectPressed);
  }

  FutureOr<void> _onLoad(_Load event, Emitter<SelectedUnitState> emit) async {
    try {
      final selectedUnit = _repository.selectedUnitNtf.value;
      if (selectedUnit != null) {
        emit(SelectedUnitState.success(selectedUnit));
        return;
      }

      final unit = await _repository.fetchSelectedUnit();
      if (unit == null) {
        emit(SelectedUnitState.notSelected());
        return;
      }

      emit(SelectedUnitState.success(unit));
    } on Object catch (e, s) {
      addError(e, s);
      emit(SelectedUnitState.failure());
    }
  }

  FutureOr<void> _onSelectPressed(
    _SelectPressed event,
    Emitter<SelectedUnitState> emit,
  ) async {
    try {
      final unit = await _repository.setSelectedUnit(event.unitId);
      if (unit == null) {
        emit(SelectedUnitState.notSelected());
        return;
      }
      emit(SelectedUnitState.success(unit));
    } catch (e, s) {
      addError(e, s);
      emit(SelectedUnitState.failure());
    }
  }
}
