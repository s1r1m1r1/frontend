// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_join_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WsJoinState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsJoinState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsJoinState()';
}


}

/// @nodoc
class $WsJoinStateCopyWith<$Res>  {
$WsJoinStateCopyWith(WsJoinState _, $Res Function(WsJoinState) __);
}



/// @nodoc


class InitialWsJoin implements WsJoinState {
  const InitialWsJoin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialWsJoin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsJoinState.initial()';
}


}




/// @nodoc


class ConnectingWsJoin implements WsJoinState {
  const ConnectingWsJoin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectingWsJoin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsJoinState.connecting()';
}


}




/// @nodoc


class ConnectedWsJoin implements WsJoinState {
  const ConnectedWsJoin(this.roomId, this.senderId);
  

 final  int roomId;
 final  int senderId;

/// Create a copy of WsJoinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectedWsJoinCopyWith<ConnectedWsJoin> get copyWith => _$ConnectedWsJoinCopyWithImpl<ConnectedWsJoin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedWsJoin&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.senderId, senderId) || other.senderId == senderId));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,senderId);

@override
String toString() {
  return 'WsJoinState.connected(roomId: $roomId, senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class $ConnectedWsJoinCopyWith<$Res> implements $WsJoinStateCopyWith<$Res> {
  factory $ConnectedWsJoinCopyWith(ConnectedWsJoin value, $Res Function(ConnectedWsJoin) _then) = _$ConnectedWsJoinCopyWithImpl;
@useResult
$Res call({
 int roomId, int senderId
});




}
/// @nodoc
class _$ConnectedWsJoinCopyWithImpl<$Res>
    implements $ConnectedWsJoinCopyWith<$Res> {
  _$ConnectedWsJoinCopyWithImpl(this._self, this._then);

  final ConnectedWsJoin _self;
  final $Res Function(ConnectedWsJoin) _then;

/// Create a copy of WsJoinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? senderId = null,}) {
  return _then(ConnectedWsJoin(
null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as int,null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DisconnectedWsJoin implements WsJoinState {
  const DisconnectedWsJoin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisconnectedWsJoin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsJoinState.disconnected()';
}


}




// dart format on
