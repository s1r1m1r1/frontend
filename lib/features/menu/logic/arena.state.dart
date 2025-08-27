part of 'arena.bloc.dart';

@freezed
sealed class ArenaState with _$ArenaState {
  const factory ArenaState.initial() = InitialArenaState;
  const factory ArenaState.loaded() = LoadedArenaState;
}
