import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'arena.event.dart';
part 'arena.state.dart';
part 'arena.bloc.freezed.dart';

class ArenaBloc extends Bloc<ArenaEvent, ArenaState> {
  ArenaBloc() : super(ArenaState.initial()) {
    on<_JoinEvent>(_onJoin);
    on<_CreateBattleEvent>(_onCreateBattle);
    on<_JoinBattleEvent>(_onJoinBattle);
    on<_LeaveBattleEvent>(_onLeaveBattle);
  }

  FutureOr<void> _onJoin(_JoinEvent event, Emitter<ArenaState> emit) {}

  FutureOr<void> _onCreateBattle(
    _CreateBattleEvent event,
    Emitter<ArenaState> emit,
  ) {}

  FutureOr<void> _onJoinBattle(
    _JoinBattleEvent event,
    Emitter<ArenaState> emit,
  ) {}

  FutureOr<void> _onLeaveBattle(
    _LeaveBattleEvent event,
    Emitter<ArenaState> emit,
  ) {}
}
