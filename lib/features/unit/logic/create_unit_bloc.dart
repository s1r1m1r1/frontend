import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/features/unit/domain/unit_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart' show CreateUnitDto;

@injectable
class CreateUnitBloc extends Bloc<CreateUnitEvent, CreateUnitState> {
  final UnitRepository _unitRepository;
  CreateUnitBloc(this._unitRepository) : super(CreateUnitState()) {
    on<_StartedCUE>(_onStarted);
    on<_NameChangedCUE>(_onNameChanged);
    on<_IncrementStatCUE>(_onIncrement);
    on<_DecrementStatCUE>(_onDecrement);
    on<_ValidateUnitCUE>(_onValidate);
    on<_CreateUnitCUE>(_onCreateUnit);
  }

  FutureOr<void> _onStarted(_StartedCUE event, Emitter<dynamic> emit) {
    emit(state.copyWith(status: UnitStateStatus.initial));
  }

  FutureOr<void> _onNameChanged(
    _NameChangedCUE event,
    Emitter<CreateUnitState> emit,
  ) {
    emit(state.copyWith(name: event.name));
    add(CreateUnitEvent.validate());
  }

  FutureOr<void> _onIncrement(
    _IncrementStatCUE event,
    Emitter<CreateUnitState> emit,
  ) {
    emit(
      state.copyWith(
        vitality: event.type == StatType.vitality ? state.vitality + 1 : null,
        atk: event.type == StatType.atk ? state.atk + 1 : null,
        def: event.type == StatType.def ? state.def + 1 : null,
        freePoint: state.freePoint - 1,
      ),
    );
    add(CreateUnitEvent.validate());
  }

  FutureOr<void> _onDecrement(
    _DecrementStatCUE event,
    Emitter<CreateUnitState> emit,
  ) {
    emit(
      state.copyWith(
        vitality: event.type == StatType.vitality ? state.vitality - 1 : null,
        atk: event.type == StatType.atk ? state.atk - 1 : null,
        def: event.type == StatType.def ? state.def - 1 : null,
        freePoint: state.freePoint + 1,
      ),
    );
    add(CreateUnitEvent.validate());
  }

  FutureOr<void> _onValidate(
    _ValidateUnitCUE event,
    Emitter<CreateUnitState> emit,
  ) {
    if (state.freePoint == 0 && state.name.isNotEmpty) {
      emit(state.copyWith(status: UnitStateStatus.valid));
    } else {
      emit(state.copyWith(status: UnitStateStatus.editing));
    }
  }

  FutureOr<void> _onCreateUnit(
    _CreateUnitCUE event,
    Emitter<CreateUnitState> emit,
  ) async {
    final success = await _unitRepository.createUnit(
      CreateUnitDto(
        name: state.name,
        atk: state.atk,
        def: state.def,
        vitality: state.vitality,
      ),
    );
    if (success) emit(state.copyWith(status: UnitStateStatus.created));
  }
}

abstract class CreateUnitEvent extends Equatable {
  const CreateUnitEvent();
  @override
  List<Object?> get props => [];

  const factory CreateUnitEvent.started() = _StartedCUE;
  const factory CreateUnitEvent.nameChanged(String value) = _NameChangedCUE;
  const factory CreateUnitEvent.incrementStats(StatType type) =
      _IncrementStatCUE;
  const factory CreateUnitEvent.decrementStats(StatType type) =
      _DecrementStatCUE;
  const factory CreateUnitEvent.validate() = _ValidateUnitCUE;
  const factory CreateUnitEvent.create() = _CreateUnitCUE;
}

class _StartedCUE extends CreateUnitEvent {
  const _StartedCUE();
}

class _NameChangedCUE extends CreateUnitEvent {
  const _NameChangedCUE(this.name);
  final String name;
  @override
  List<Object?> get props => [name];
}

enum StatType { vitality, atk, def }

class _IncrementStatCUE extends CreateUnitEvent {
  const _IncrementStatCUE(this.type);
  final StatType type;
  @override
  List<Object?> get props => [type];
}

class _DecrementStatCUE extends CreateUnitEvent {
  const _DecrementStatCUE(this.type);

  final StatType type;
  @override
  List<Object?> get props => [type];
}

class _ValidateUnitCUE extends CreateUnitEvent {
  const _ValidateUnitCUE();
}

class _CreateUnitCUE extends CreateUnitEvent {
  const _CreateUnitCUE();
}

//--------------------------------------------------------------------------------
enum UnitStateStatus { initial, editing, valid, created }

class CreateUnitState extends Equatable {
  final String name;

  final int atk; // атака
  final int def; // защита

  final int vitality; // жизненная сила

  final int freePoint;

  final UnitStateStatus status;
  const CreateUnitState({
    this.status = UnitStateStatus.initial,
    this.name = '',
    this.atk = 10,
    this.def = 10,
    this.vitality = 10,
    this.freePoint = 10,
  });

  CreateUnitState copyWith({
    int? atk,
    int? def,
    int? vitality,
    String? name,
    UnitStateStatus? status,
    int? freePoint,
  }) {
    return CreateUnitState(
      name: name ?? this.name,
      atk: atk ?? this.atk,
      def: def ?? this.def,
      vitality: vitality ?? this.vitality,
      freePoint: freePoint ?? this.freePoint,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [freePoint, name, atk, def, vitality, status];
}
