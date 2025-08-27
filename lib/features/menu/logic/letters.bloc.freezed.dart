// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letters.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LettersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LettersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LettersEvent()';
}


}

/// @nodoc
class $LettersEventCopyWith<$Res>  {
$LettersEventCopyWith(LettersEvent _, $Res Function(LettersEvent) __);
}



/// @nodoc


class _SubscribedLE extends LettersEvent {
  const _SubscribedLE(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscribedLE);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LettersEvent.subscribed()';
}


}




/// @nodoc


class _JoinRoomLE extends LettersEvent {
  const _JoinRoomLE(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinRoomLE);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LettersEvent.joinRoom()';
}


}




/// @nodoc


class _NewPressedLE extends LettersEvent {
  const _NewPressedLE(this.message): super._();
  

 final  String message;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewPressedLECopyWith<_NewPressedLE> get copyWith => __$NewPressedLECopyWithImpl<_NewPressedLE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewPressedLE&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LettersEvent.newPressed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NewPressedLECopyWith<$Res> implements $LettersEventCopyWith<$Res> {
  factory _$NewPressedLECopyWith(_NewPressedLE value, $Res Function(_NewPressedLE) _then) = __$NewPressedLECopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NewPressedLECopyWithImpl<$Res>
    implements _$NewPressedLECopyWith<$Res> {
  __$NewPressedLECopyWithImpl(this._self, this._then);

  final _NewPressedLE _self;
  final $Res Function(_NewPressedLE) _then;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NewPressedLE(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeletePressedLE extends LettersEvent {
  const _DeletePressedLE(this.letterId): super._();
  

 final  int letterId;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePressedLECopyWith<_DeletePressedLE> get copyWith => __$DeletePressedLECopyWithImpl<_DeletePressedLE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePressedLE&&(identical(other.letterId, letterId) || other.letterId == letterId));
}


@override
int get hashCode => Object.hash(runtimeType,letterId);

@override
String toString() {
  return 'LettersEvent.deletePressed(letterId: $letterId)';
}


}

/// @nodoc
abstract mixin class _$DeletePressedLECopyWith<$Res> implements $LettersEventCopyWith<$Res> {
  factory _$DeletePressedLECopyWith(_DeletePressedLE value, $Res Function(_DeletePressedLE) _then) = __$DeletePressedLECopyWithImpl;
@useResult
$Res call({
 int letterId
});




}
/// @nodoc
class __$DeletePressedLECopyWithImpl<$Res>
    implements _$DeletePressedLECopyWith<$Res> {
  __$DeletePressedLECopyWithImpl(this._self, this._then);

  final _DeletePressedLE _self;
  final $Res Function(_DeletePressedLE) _then;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? letterId = null,}) {
  return _then(_DeletePressedLE(
null == letterId ? _self.letterId : letterId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
