// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sender.cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SenderState {

 int? get senderId;
/// Create a copy of SenderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SenderStateCopyWith<SenderState> get copyWith => _$SenderStateCopyWithImpl<SenderState>(this as SenderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SenderState&&(identical(other.senderId, senderId) || other.senderId == senderId));
}


@override
int get hashCode => Object.hash(runtimeType,senderId);

@override
String toString() {
  return 'SenderState(senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class $SenderStateCopyWith<$Res>  {
  factory $SenderStateCopyWith(SenderState value, $Res Function(SenderState) _then) = _$SenderStateCopyWithImpl;
@useResult
$Res call({
 int? senderId
});




}
/// @nodoc
class _$SenderStateCopyWithImpl<$Res>
    implements $SenderStateCopyWith<$Res> {
  _$SenderStateCopyWithImpl(this._self, this._then);

  final SenderState _self;
  final $Res Function(SenderState) _then;

/// Create a copy of SenderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? senderId = freezed,}) {
  return _then(_self.copyWith(
senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}



/// @nodoc


class _SenderState implements SenderState {
  const _SenderState(this.senderId);
  

@override final  int? senderId;

/// Create a copy of SenderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SenderStateCopyWith<_SenderState> get copyWith => __$SenderStateCopyWithImpl<_SenderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SenderState&&(identical(other.senderId, senderId) || other.senderId == senderId));
}


@override
int get hashCode => Object.hash(runtimeType,senderId);

@override
String toString() {
  return 'SenderState(senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class _$SenderStateCopyWith<$Res> implements $SenderStateCopyWith<$Res> {
  factory _$SenderStateCopyWith(_SenderState value, $Res Function(_SenderState) _then) = __$SenderStateCopyWithImpl;
@override @useResult
$Res call({
 int? senderId
});




}
/// @nodoc
class __$SenderStateCopyWithImpl<$Res>
    implements _$SenderStateCopyWith<$Res> {
  __$SenderStateCopyWithImpl(this._self, this._then);

  final _SenderState _self;
  final $Res Function(_SenderState) _then;

/// Create a copy of SenderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? senderId = freezed,}) {
  return _then(_SenderState(
freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
