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


class InitialSession extends Session {
  const InitialSession(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Session.initial()';
}


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


class LogoutSession extends Session {
  const LogoutSession(this.error): super._();
  

 final  SessionError error;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutSessionCopyWith<LogoutSession> get copyWith => _$LogoutSessionCopyWithImpl<LogoutSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutSession&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'Session.logout(error: $error)';
}


}

/// @nodoc
abstract mixin class $LogoutSessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory $LogoutSessionCopyWith(LogoutSession value, $Res Function(LogoutSession) _then) = _$LogoutSessionCopyWithImpl;
@useResult
$Res call({
 SessionError error
});




}
/// @nodoc
class _$LogoutSessionCopyWithImpl<$Res>
    implements $LogoutSessionCopyWith<$Res> {
  _$LogoutSessionCopyWithImpl(this._self, this._then);

  final LogoutSession _self;
  final $Res Function(LogoutSession) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(LogoutSession(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as SessionError,
  ));
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


class WsSession extends Session implements ISessionUser {
  const WsSession({required this.user, required this.unit, this.gameOption, this.status = WSSessionStatus.ready}): super._();
  

 final  User user;
 final  Unit unit;
 final  WsGameOption? gameOption;
@JsonKey() final  WSSessionStatus status;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsSessionCopyWith<WsSession> get copyWith => _$WsSessionCopyWithImpl<WsSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsSession&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.gameOption, gameOption) || other.gameOption == gameOption)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,user,unit,gameOption,status);

@override
String toString() {
  return 'Session.ws(user: $user, unit: $unit, gameOption: $gameOption, status: $status)';
}


}

/// @nodoc
abstract mixin class $WsSessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory $WsSessionCopyWith(WsSession value, $Res Function(WsSession) _then) = _$WsSessionCopyWithImpl;
@useResult
$Res call({
 User user, Unit unit, WsGameOption? gameOption, WSSessionStatus status
});


$UserCopyWith<$Res> get user;$WsGameOptionCopyWith<$Res>? get gameOption;

}
/// @nodoc
class _$WsSessionCopyWithImpl<$Res>
    implements $WsSessionCopyWith<$Res> {
  _$WsSessionCopyWithImpl(this._self, this._then);

  final WsSession _self;
  final $Res Function(WsSession) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? unit = null,Object? gameOption = freezed,Object? status = null,}) {
  return _then(WsSession(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Unit,gameOption: freezed == gameOption ? _self.gameOption : gameOption // ignore: cast_nullable_to_non_nullable
as WsGameOption?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WSSessionStatus,
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
$WsGameOptionCopyWith<$Res>? get gameOption {
    if (_self.gameOption == null) {
    return null;
  }

  return $WsGameOptionCopyWith<$Res>(_self.gameOption!, (value) {
    return _then(_self.copyWith(gameOption: value));
  });
}
}

// dart format on
