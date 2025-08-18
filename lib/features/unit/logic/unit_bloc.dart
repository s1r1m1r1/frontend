import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/features/unit/domain/unit.dart';
import 'package:frontend/features/unit/domain/unit_repository.dart';
import 'package:injectable/injectable.dart';

/// ChangeNotifier update goRouter redirect
@injectable
class UnitBloc extends Bloc<UnitEvent, UnitState> {
  final UnitRepository _repository;
  UnitBloc(this._repository) : super(const UnitState()) {
    on<ReadUnitEvent>(_onRead);
  }

  FutureOr<void> _onRead(ReadUnitEvent event, Emitter<UnitState> emit) async {
    try {
      emit(state.copyWith(status: UnitStateStatus.loading));
      final record = await _repository.fetchUnits();
      if (record != null) {
        emit(
          state.copyWith(
            selectedId: record.$1,
            units: record.$2,
            status: UnitStateStatus.success,
          ),
        );
        return;
      }
      emit(UnitState.empty);
    } catch (e, s) {
      addError(e, s);
      emit(state.copyWith(status: UnitStateStatus.failure));
    }
  }
}

abstract class UnitEvent extends Equatable {
  const UnitEvent();
  @override
  List<Object> get props => [];

  const factory UnitEvent.readUnit() = ReadUnitEvent;
}

class ReadUnitEvent extends UnitEvent {
  const ReadUnitEvent();
}

class SelectUnitEvent extends UnitEvent {
  const SelectUnitEvent(this.index);
  final int index;
  @override
  List<Object> get props => [index];
}

enum UnitStateStatus { initial, loading, success, empty, failure }

class UnitState extends Equatable {
  const UnitState({
    this.status = UnitStateStatus.initial,
    this.units = const [],
  });
  final List<Unit> units;
  final UnitStateStatus status;

  static const empty = UnitState(status: UnitStateStatus.empty);
  UnitState copyWith({
    List<Unit>? units,
    UnitStateStatus? status,
    int? selectedId,
  }) {
    return UnitState(units: units ?? this.units, status: status ?? this.status);
  }

  @override
  List<Object> get props => [units, status];
}
