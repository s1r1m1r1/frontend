// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Session {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Session()';
}


}

/// @nodoc
class $SessionCopyWith<$Res>  {
$SessionCopyWith(Session _, $Res Function(Session) __);
}



/// @nodoc


class PendingSession extends Session {
  const PendingSession(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Session.pending()';
}


}




/// @nodoc


class WelcomeSession extends Session implements ISessionUser {
  const WelcomeSession({required this.user}): super._();
  

 final  User user;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeSessionCopyWith<WelcomeSession> get copyWith => _$WelcomeSessionCopyWithImpl<WelcomeSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeSession&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'Session.welcome(user: $user)';
}


}

/// @nodoc
abstract mixin class $WelcomeSessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory $WelcomeSessionCopyWith(WelcomeSession value, $Res Function(WelcomeSession) _then) = _$WelcomeSessionCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$WelcomeSessionCopyWithImpl<$Res>
    implements $WelcomeSessionCopyWith<$Res> {
  _$WelcomeSessionCopyWithImpl(this._self, this._then);

  final WelcomeSession _self;
  final $Res Function(WelcomeSession) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(WelcomeSession(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class GameReadySession extends Session implements ISessionUser, ISessionUnit {
  const GameReadySession({required this.user, required this.unit}): super._();
  

 final  User user;
 final  Unit unit;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameReadySessionCopyWith<GameReadySession> get copyWith => _$GameReadySessionCopyWithImpl<GameReadySession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameReadySession&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,user,unit);

@override
String toString() {
  return 'Session.gameReady(user: $user, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $GameReadySessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory $GameReadySessionCopyWith(GameReadySession value, $Res Function(GameReadySession) _then) = _$GameReadySessionCopyWithImpl;
@useResult
$Res call({
 User user, Unit unit
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$GameReadySessionCopyWithImpl<$Res>
    implements $GameReadySessionCopyWith<$Res> {
  _$GameReadySessionCopyWithImpl(this._self, this._then);

  final GameReadySession _self;
  final $Res Function(GameReadySession) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? unit = null,}) {
  return _then(GameReadySession(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Unit,
  ));
}

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class GameJoinedSession extends Session implements ISessionUser, ISessionUnit, ISessionWS {
  const GameJoinedSession({required this.user, required this.unit, required this.gameOption}): super._();
  

 final  User user;
 final  Unit unit;
 final  WsGameOption gameOption;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameJoinedSessionCopyWith<GameJoinedSession> get copyWith => _$GameJoinedSessionCopyWithImpl<GameJoinedSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameJoinedSession&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.gameOption, gameOption) || other.gameOption == gameOption));
}


@override
int get hashCode => Object.hash(runtimeType,user,unit,gameOption);

@override
String toString() {
  return 'Session.gameJoined(user: $user, unit: $unit, gameOption: $gameOption)';
}


}

/// @nodoc
abstract mixin class $GameJoinedSessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory $GameJoinedSessionCopyWith(GameJoinedSession value, $Res Function(GameJoinedSession) _then) = _$GameJoinedSessionCopyWithImpl;
@useResult
$Res call({
 User user, Unit unit, WsGameOption gameOption
});


$UserCopyWith<$Res> get user;$WsGameOptionCopyWith<$Res> get gameOption;

}
/// @nodoc
class _$GameJoinedSessionCopyWithImpl<$Res>
    implements $GameJoinedSessionCopyWith<$Res> {
  _$GameJoinedSessionCopyWithImpl(this._self, this._then);

  final GameJoinedSession _self;
  final $Res Function(GameJoinedSession) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? unit = null,Object? gameOption = null,}) {
  return _then(GameJoinedSession(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Unit,gameOption: null == gameOption ? _self.gameOption : gameOption // ignore: cast_nullable_to_non_nullable
as WsGameOption,
  ));
}

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WsGameOptionCopyWith<$Res> get gameOption {
  
  return $WsGameOptionCopyWith<$Res>(_self.gameOption, (value) {
    return _then(_self.copyWith(gameOption: value));
  });
}
}

/// @nodoc


class GameFinishedSession extends Session implements ISessionUser, ISessionUnit, ISessionWS {
  const GameFinishedSession({required this.user, required this.unit, required this.gameOption}): super._();
  

 final  User user;
 final  Unit unit;
 final  WsGameOption gameOption;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameFinishedSessionCopyWith<GameFinishedSession> get copyWith => _$GameFinishedSessionCopyWithImpl<GameFinishedSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameFinishedSession&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.gameOption, gameOption) || other.gameOption == gameOption));
}


@override
int get hashCode => Object.hash(runtimeType,user,unit,gameOption);

@override
String toString() {
  return 'Session.gameFinished(user: $user, unit: $unit, gameOption: $gameOption)';
}


}

/// @nodoc
abstract mixin class $GameFinishedSessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory $GameFinishedSessionCopyWith(GameFinishedSession value, $Res Function(GameFinishedSession) _then) = _$GameFinishedSessionCopyWithImpl;
@useResult
$Res call({
 User user, Unit unit, WsGameOption gameOption
});


$UserCopyWith<$Res> get user;$WsGameOptionCopyWith<$Res> get gameOption;

}
/// @nodoc
class _$GameFinishedSessionCopyWithImpl<$Res>
    implements $GameFinishedSessionCopyWith<$Res> {
  _$GameFinishedSessionCopyWithImpl(this._self, this._then);

  final GameFinishedSession _self;
  final $Res Function(GameFinishedSession) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? unit = null,Object? gameOption = null,}) {
  return _then(GameFinishedSession(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Unit,gameOption: null == gameOption ? _self.gameOption : gameOption // ignore: cast_nullable_to_non_nullable
as WsGameOption,
  ));
}

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WsGameOptionCopyWith<$Res> get gameOption {
  
  return $WsGameOptionCopyWith<$Res>(_self.gameOption, (value) {
    return _then(_self.copyWith(gameOption: value));
  });
}
}

// dart format on
