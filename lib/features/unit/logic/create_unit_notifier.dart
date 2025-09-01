import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:frontend/features/unit/domain/unit_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart' show CreateUnitDto;

@injectable
class CreateUnitNotifier extends LogNotifier<CreateUnitState> {
  final UnitRepository _unitRepository;
  CreateUnitNotifier(this._unitRepository) : super(CreateUnitState());

  FutureOr<void> started() {
    value = value.copyWith(status: UnitStateStatus.initial);
  }

  FutureOr<void> nameChanged(String name) {
    value = value.copyWith(name: name);
    validate();
  }

  FutureOr<void> increment(StatType type) {
    value = value.copyWith(
      vitality: type == StatType.vitality ? value.vitality + 1 : null,
      atk: type == StatType.atk ? value.atk + 1 : null,
      def: type == StatType.def ? value.def + 1 : null,
      freePoint: value.freePoint - 1,
    );
    validate();
  }

  FutureOr<void> decrement(StatType type) {
    value = value.copyWith(
      vitality: type == StatType.vitality ? value.vitality - 1 : null,
      atk: type == StatType.atk ? value.atk - 1 : null,
      def: type == StatType.def ? value.def - 1 : null,
      freePoint: value.freePoint + 1,
    );
    validate();
  }

  FutureOr<void> validate() {
    if (value.freePoint == 0 && value.name.isNotEmpty) {
      value = value.copyWith(status: UnitStateStatus.valid);
    } else {
      value = value.copyWith(status: UnitStateStatus.editing);
    }
  }

  FutureOr<void> createUnit() async {
    final success = await _unitRepository.createUnit(
      CreateUnitDto(
        name: value.name,
        atk: value.atk,
        def: value.def,
        vitality: value.vitality,
      ),
    );
    if (success) {
      value = value.copyWith(status: UnitStateStatus.created);
    }
  }
}

enum StatType { vitality, atk, def }

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
