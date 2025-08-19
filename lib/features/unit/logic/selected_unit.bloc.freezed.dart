// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_unit.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedUnitState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedUnitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectedUnitState()';
}


}

/// @nodoc
class $SelectedUnitStateCopyWith<$Res>  {
$SelectedUnitStateCopyWith(SelectedUnitState _, $Res Function(SelectedUnitState) __);
}



/// @nodoc


class Initial_US extends SelectedUnitState {
  const Initial_US(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial_US);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectedUnitState.initial()';
}


}




/// @nodoc


class Loading_US extends SelectedUnitState {
  const Loading_US(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading_US);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectedUnitState.loading()';
}


}




/// @nodoc


class Success_US extends SelectedUnitState {
  const Success_US(this.unit): super._();
  

 final  Unit unit;

/// Create a copy of SelectedUnitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Success_USCopyWith<Success_US> get copyWith => _$Success_USCopyWithImpl<Success_US>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success_US&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,unit);

@override
String toString() {
  return 'SelectedUnitState.success(unit: $unit)';
}


}

/// @nodoc
abstract mixin class $Success_USCopyWith<$Res> implements $SelectedUnitStateCopyWith<$Res> {
  factory $Success_USCopyWith(Success_US value, $Res Function(Success_US) _then) = _$Success_USCopyWithImpl;
@useResult
$Res call({
 Unit unit
});




}
/// @nodoc
class _$Success_USCopyWithImpl<$Res>
    implements $Success_USCopyWith<$Res> {
  _$Success_USCopyWithImpl(this._self, this._then);

  final Success_US _self;
  final $Res Function(Success_US) _then;

/// Create a copy of SelectedUnitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unit = null,}) {
  return _then(Success_US(
null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Unit,
  ));
}


}

/// @nodoc


class NotSelected_US extends SelectedUnitState {
  const NotSelected_US(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotSelected_US);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectedUnitState.notSelected()';
}


}




/// @nodoc


class Failure_US extends SelectedUnitState {
  const Failure_US(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure_US);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectedUnitState.failure()';
}


}




/// @nodoc
mixin _$SelectedUnitEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedUnitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectedUnitEvent()';
}


}

/// @nodoc
class $SelectedUnitEventCopyWith<$Res>  {
$SelectedUnitEventCopyWith(SelectedUnitEvent _, $Res Function(SelectedUnitEvent) __);
}



/// @nodoc


class _Load implements SelectedUnitEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectedUnitEvent.load()';
}


}




/// @nodoc


class _SelectPressed implements SelectedUnitEvent {
  const _SelectPressed(this.unitId);
  

 final  int unitId;

/// Create a copy of SelectedUnitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectPressedCopyWith<_SelectPressed> get copyWith => __$SelectPressedCopyWithImpl<_SelectPressed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectPressed&&(identical(other.unitId, unitId) || other.unitId == unitId));
}


@override
int get hashCode => Object.hash(runtimeType,unitId);

@override
String toString() {
  return 'SelectedUnitEvent.select(unitId: $unitId)';
}


}

/// @nodoc
abstract mixin class _$SelectPressedCopyWith<$Res> implements $SelectedUnitEventCopyWith<$Res> {
  factory _$SelectPressedCopyWith(_SelectPressed value, $Res Function(_SelectPressed) _then) = __$SelectPressedCopyWithImpl;
@useResult
$Res call({
 int unitId
});




}
/// @nodoc
class __$SelectPressedCopyWithImpl<$Res>
    implements _$SelectPressedCopyWith<$Res> {
  __$SelectPressedCopyWithImpl(this._self, this._then);

  final _SelectPressed _self;
  final $Res Function(_SelectPressed) _then;

/// Create a copy of SelectedUnitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unitId = null,}) {
  return _then(_SelectPressed(
null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
