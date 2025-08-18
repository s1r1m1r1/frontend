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


/// Adds pattern-matching-related methods to [WsJoinState].
extension WsJoinStatePatterns on WsJoinState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialWsJoin value)?  initial,TResult Function( ConnectingWsJoin value)?  connecting,TResult Function( ConnectedWsJoin value)?  connected,TResult Function( DisconnectedWsJoin value)?  disconnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialWsJoin() when initial != null:
return initial(_that);case ConnectingWsJoin() when connecting != null:
return connecting(_that);case ConnectedWsJoin() when connected != null:
return connected(_that);case DisconnectedWsJoin() when disconnected != null:
return disconnected(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialWsJoin value)  initial,required TResult Function( ConnectingWsJoin value)  connecting,required TResult Function( ConnectedWsJoin value)  connected,required TResult Function( DisconnectedWsJoin value)  disconnected,}){
final _that = this;
switch (_that) {
case InitialWsJoin():
return initial(_that);case ConnectingWsJoin():
return connecting(_that);case ConnectedWsJoin():
return connected(_that);case DisconnectedWsJoin():
return disconnected(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialWsJoin value)?  initial,TResult? Function( ConnectingWsJoin value)?  connecting,TResult? Function( ConnectedWsJoin value)?  connected,TResult? Function( DisconnectedWsJoin value)?  disconnected,}){
final _that = this;
switch (_that) {
case InitialWsJoin() when initial != null:
return initial(_that);case ConnectingWsJoin() when connecting != null:
return connecting(_that);case ConnectedWsJoin() when connected != null:
return connected(_that);case DisconnectedWsJoin() when disconnected != null:
return disconnected(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  connecting,TResult Function()?  connected,TResult Function()?  disconnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialWsJoin() when initial != null:
return initial();case ConnectingWsJoin() when connecting != null:
return connecting();case ConnectedWsJoin() when connected != null:
return connected();case DisconnectedWsJoin() when disconnected != null:
return disconnected();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  connecting,required TResult Function()  connected,required TResult Function()  disconnected,}) {final _that = this;
switch (_that) {
case InitialWsJoin():
return initial();case ConnectingWsJoin():
return connecting();case ConnectedWsJoin():
return connected();case DisconnectedWsJoin():
return disconnected();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  connecting,TResult? Function()?  connected,TResult? Function()?  disconnected,}) {final _that = this;
switch (_that) {
case InitialWsJoin() when initial != null:
return initial();case ConnectingWsJoin() when connecting != null:
return connecting();case ConnectedWsJoin() when connected != null:
return connected();case DisconnectedWsJoin() when disconnected != null:
return disconnected();case _:
  return null;

}
}

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
  const ConnectedWsJoin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedWsJoin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsJoinState.connected()';
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
