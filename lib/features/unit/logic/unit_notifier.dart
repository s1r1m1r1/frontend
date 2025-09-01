import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:frontend/features/unit/domain/unit.dart';
import 'package:frontend/features/unit/domain/unit_repository.dart';
import 'package:injectable/injectable.dart';

/// ChangeNotifier update goRouter redirect
@injectable
class UnitNotifier extends LogNotifier<UnitState> {
  final UnitRepository _repository;
  UnitNotifier(this._repository) : super(const UnitState());

  FutureOr<void> read() async {
    try {
      value = (value.copyWith(status: UnitStateStatus.loading));
      final record = await _repository.fetchUnits();
      if (record != null) {
        value = value.copyWith(
          selectedId: record.$1,
          units: record.$2,
          status: UnitStateStatus.success,
        );
        return;
      }
      value = UnitState.empty;
    } catch (e, s) {
      addError(e, s);
      value = value.copyWith(status: UnitStateStatus.failure);
    }
  }
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
