import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/unit/domain/unit.dart';

class SessionUnitCubit extends Cubit<SessionUnitState> {
  SessionUnitCubit() : super(const SessionUnitState());

  void setUnit(Unit? unit) {
    emit(state.copyWith(unit: unit));
  }
}

enum SessionUnitStateStatus { initial, loading, success, empty, failure }

class SessionUnitState extends Equatable {
  const SessionUnitState({this.status = SessionUnitStateStatus.initial, this.unit});
  final SessionUnitStateStatus status;
  final Unit? unit;

  SessionUnitState copyWith({SessionUnitStateStatus? status, Unit? unit}) {
    return SessionUnitState(status: status ?? this.status, unit: unit ?? this.unit);
  }

  int get unitId => unit?.id ?? -1;

  @override
  List<Object?> get props => [status, unit];
}
