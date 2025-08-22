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


class _JoinRoomLE extends LettersEvent {
  const _JoinRoomLE({required this.roomId, required this.senderToken}): super._();
  

 final  String roomId;
 final  String senderToken;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinRoomLECopyWith<_JoinRoomLE> get copyWith => __$JoinRoomLECopyWithImpl<_JoinRoomLE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinRoomLE&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.senderToken, senderToken) || other.senderToken == senderToken));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,senderToken);

@override
String toString() {
  return 'LettersEvent.joinRoom(roomId: $roomId, senderToken: $senderToken)';
}


}

/// @nodoc
abstract mixin class _$JoinRoomLECopyWith<$Res> implements $LettersEventCopyWith<$Res> {
  factory _$JoinRoomLECopyWith(_JoinRoomLE value, $Res Function(_JoinRoomLE) _then) = __$JoinRoomLECopyWithImpl;
@useResult
$Res call({
 String roomId, String senderToken
});




}
/// @nodoc
class __$JoinRoomLECopyWithImpl<$Res>
    implements _$JoinRoomLECopyWith<$Res> {
  __$JoinRoomLECopyWithImpl(this._self, this._then);

  final _JoinRoomLE _self;
  final $Res Function(_JoinRoomLE) _then;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? senderToken = null,}) {
  return _then(_JoinRoomLE(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,senderToken: null == senderToken ? _self.senderToken : senderToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NewPressedLE extends LettersEvent {
  const _NewPressedLE({required this.roomId, required this.message, required this.senderToken}): super._();
  

 final  String roomId;
 final  String message;
 final  String senderToken;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewPressedLECopyWith<_NewPressedLE> get copyWith => __$NewPressedLECopyWithImpl<_NewPressedLE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewPressedLE&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.message, message) || other.message == message)&&(identical(other.senderToken, senderToken) || other.senderToken == senderToken));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,message,senderToken);

@override
String toString() {
  return 'LettersEvent.newPressed(roomId: $roomId, message: $message, senderToken: $senderToken)';
}


}

/// @nodoc
abstract mixin class _$NewPressedLECopyWith<$Res> implements $LettersEventCopyWith<$Res> {
  factory _$NewPressedLECopyWith(_NewPressedLE value, $Res Function(_NewPressedLE) _then) = __$NewPressedLECopyWithImpl;
@useResult
$Res call({
 String roomId, String message, String senderToken
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
@pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? message = null,Object? senderToken = null,}) {
  return _then(_NewPressedLE(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,senderToken: null == senderToken ? _self.senderToken : senderToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeletePressedLE extends LettersEvent {
  const _DeletePressedLE(this.senderId, this.letterId): super._();
  

 final  String senderId;
 final  int letterId;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePressedLECopyWith<_DeletePressedLE> get copyWith => __$DeletePressedLECopyWithImpl<_DeletePressedLE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePressedLE&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.letterId, letterId) || other.letterId == letterId));
}


@override
int get hashCode => Object.hash(runtimeType,senderId,letterId);

@override
String toString() {
  return 'LettersEvent.deletePressed(senderId: $senderId, letterId: $letterId)';
}


}

/// @nodoc
abstract mixin class _$DeletePressedLECopyWith<$Res> implements $LettersEventCopyWith<$Res> {
  factory _$DeletePressedLECopyWith(_DeletePressedLE value, $Res Function(_DeletePressedLE) _then) = __$DeletePressedLECopyWithImpl;
@useResult
$Res call({
 String senderId, int letterId
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
@pragma('vm:prefer-inline') $Res call({Object? senderId = null,Object? letterId = null,}) {
  return _then(_DeletePressedLE(
null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,null == letterId ? _self.letterId : letterId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _OnLetterLE extends LettersEvent {
  const _OnLetterLE(final  List<LetterDto> letters): _letters = letters,super._();
  

 final  List<LetterDto> _letters;
 List<LetterDto> get letters {
  if (_letters is EqualUnmodifiableListView) return _letters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_letters);
}


/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnLetterLECopyWith<_OnLetterLE> get copyWith => __$OnLetterLECopyWithImpl<_OnLetterLE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnLetterLE&&const DeepCollectionEquality().equals(other._letters, _letters));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_letters));

@override
String toString() {
  return 'LettersEvent._onLetter(letters: $letters)';
}


}

/// @nodoc
abstract mixin class _$OnLetterLECopyWith<$Res> implements $LettersEventCopyWith<$Res> {
  factory _$OnLetterLECopyWith(_OnLetterLE value, $Res Function(_OnLetterLE) _then) = __$OnLetterLECopyWithImpl;
@useResult
$Res call({
 List<LetterDto> letters
});




}
/// @nodoc
class __$OnLetterLECopyWithImpl<$Res>
    implements _$OnLetterLECopyWith<$Res> {
  __$OnLetterLECopyWithImpl(this._self, this._then);

  final _OnLetterLE _self;
  final $Res Function(_OnLetterLE) _then;

/// Create a copy of LettersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? letters = null,}) {
  return _then(_OnLetterLE(
null == letters ? _self._letters : letters // ignore: cast_nullable_to_non_nullable
as List<LetterDto>,
  ));
}


}

// dart format on
