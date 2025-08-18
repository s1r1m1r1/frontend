import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/unit/domain/unit_repository.dart';
import 'package:injectable/injectable.dart';

part 'app_stage.event.dart';
part 'app_stage.state.dart';
part 'app_stage.bloc.freezed.dart';

@injectable
class AppStageBloc extends Bloc<AppStageEvent, AppStageState> {
  final AuthRepository _authRepository;
  final UnitRepository _unitRepository;

  AppStageBloc(this._authRepository, this._unitRepository)
    : super(const AppStageState.initial()) {
    on<_StartedEvent>(_onStarted);
  }

  FutureOr<void> _onStarted(event, Emitter<AppStageState> emit) async {

  }
}
