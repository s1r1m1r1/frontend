// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arena.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArenaEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArenaEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArenaEvent()';
}


}

/// @nodoc
class $ArenaEventCopyWith<$Res>  {
$ArenaEventCopyWith(ArenaEvent _, $Res Function(ArenaEvent) __);
}



/// @nodoc


class _JoinEvent implements ArenaEvent {
  const _JoinEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArenaEvent.join()';
}


}




/// @nodoc


class _CreateBattleEvent implements ArenaEvent {
  const _CreateBattleEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateBattleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArenaEvent.createBattle()';
}


}




/// @nodoc


class _JoinBattleEvent implements ArenaEvent {
  const _JoinBattleEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinBattleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArenaEvent.joinBattle()';
}


}




/// @nodoc


class _LeaveBattleEvent implements ArenaEvent {
  const _LeaveBattleEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveBattleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArenaEvent.leaveBattle()';
}


}




/// @nodoc
mixin _$ArenaState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArenaState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArenaState()';
}


}

/// @nodoc
class $ArenaStateCopyWith<$Res>  {
$ArenaStateCopyWith(ArenaState _, $Res Function(ArenaState) __);
}



/// @nodoc


class InitialArenaState implements ArenaState {
  const InitialArenaState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialArenaState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArenaState.initial()';
}


}




/// @nodoc


class LoadedArenaState implements ArenaState {
  const LoadedArenaState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedArenaState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArenaState.loaded()';
}


}




// dart format on
