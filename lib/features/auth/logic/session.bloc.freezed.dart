// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionState implements DiagnosticableTreeMixin {

 SessionStateStatus get status; Session? get session; String? get errorMessage;
/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionStateCopyWith<SessionState> get copyWith => _$SessionStateCopyWithImpl<SessionState>(this as SessionState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionState'))
    ..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('session', session))..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState&&(identical(other.status, status) || other.status == status)&&(identical(other.session, session) || other.session == session)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,session,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionState(status: $status, session: $session, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SessionStateCopyWith<$Res>  {
  factory $SessionStateCopyWith(SessionState value, $Res Function(SessionState) _then) = _$SessionStateCopyWithImpl;
@useResult
$Res call({
 SessionStateStatus status, Session? session, String? errorMessage
});


$SessionCopyWith<$Res>? get session;

}
/// @nodoc
class _$SessionStateCopyWithImpl<$Res>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._self, this._then);

  final SessionState _self;
  final $Res Function(SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? session = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStateStatus,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}



/// @nodoc


class _SessionState extends SessionState with DiagnosticableTreeMixin {
  const _SessionState({this.status = SessionStateStatus.initial, this.session, this.errorMessage}): super._();
  

@override@JsonKey() final  SessionStateStatus status;
@override final  Session? session;
@override final  String? errorMessage;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionStateCopyWith<_SessionState> get copyWith => __$SessionStateCopyWithImpl<_SessionState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionState'))
    ..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('session', session))..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionState&&(identical(other.status, status) || other.status == status)&&(identical(other.session, session) || other.session == session)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,session,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionState(status: $status, session: $session, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SessionStateCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory _$SessionStateCopyWith(_SessionState value, $Res Function(_SessionState) _then) = __$SessionStateCopyWithImpl;
@override @useResult
$Res call({
 SessionStateStatus status, Session? session, String? errorMessage
});


@override $SessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$SessionStateCopyWithImpl<$Res>
    implements _$SessionStateCopyWith<$Res> {
  __$SessionStateCopyWithImpl(this._self, this._then);

  final _SessionState _self;
  final $Res Function(_SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? session = freezed,Object? errorMessage = freezed,}) {
  return _then(_SessionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStateStatus,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc
mixin _$SessionEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionEvent()';
}


}

/// @nodoc
class $SessionEventCopyWith<$Res>  {
$SessionEventCopyWith(SessionEvent _, $Res Function(SessionEvent) __);
}



/// @nodoc


class _ReadSessionSE with DiagnosticableTreeMixin implements SessionEvent {
  const _ReadSessionSE();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionEvent.read'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadSessionSE);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionEvent.read()';
}


}




/// @nodoc


class _SetSessionSE with DiagnosticableTreeMixin implements SessionEvent {
  const _SetSessionSE(this.session);
  

 final  Session? session;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetSessionSECopyWith<_SetSessionSE> get copyWith => __$SetSessionSECopyWithImpl<_SetSessionSE>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionEvent.setSession'))
    ..add(DiagnosticsProperty('session', session));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetSessionSE&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionEvent.setSession(session: $session)';
}


}

/// @nodoc
abstract mixin class _$SetSessionSECopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$SetSessionSECopyWith(_SetSessionSE value, $Res Function(_SetSessionSE) _then) = __$SetSessionSECopyWithImpl;
@useResult
$Res call({
 Session? session
});


$SessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$SetSessionSECopyWithImpl<$Res>
    implements _$SetSessionSECopyWith<$Res> {
  __$SetSessionSECopyWithImpl(this._self, this._then);

  final _SetSessionSE _self;
  final $Res Function(_SetSessionSE) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = freezed,}) {
  return _then(_SetSessionSE(
freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session?,
  ));
}

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class _JoinWsSE with DiagnosticableTreeMixin implements SessionEvent {
  const _JoinWsSE(this.token);
  

 final  String token;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinWsSECopyWith<_JoinWsSE> get copyWith => __$JoinWsSECopyWithImpl<_JoinWsSE>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionEvent.joinWs'))
    ..add(DiagnosticsProperty('token', token));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinWsSE&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionEvent.joinWs(token: $token)';
}


}

/// @nodoc
abstract mixin class _$JoinWsSECopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$JoinWsSECopyWith(_JoinWsSE value, $Res Function(_JoinWsSE) _then) = __$JoinWsSECopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class __$JoinWsSECopyWithImpl<$Res>
    implements _$JoinWsSECopyWith<$Res> {
  __$JoinWsSECopyWithImpl(this._self, this._then);

  final _JoinWsSE _self;
  final $Res Function(_JoinWsSE) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_JoinWsSE(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubscribeWsSE with DiagnosticableTreeMixin implements SessionEvent {
  const _SubscribeWsSE();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionEvent.subscribeWs'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscribeWsSE);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionEvent.subscribeWs()';
}


}




/// @nodoc


class _UpdateSessionSE with DiagnosticableTreeMixin implements SessionEvent {
  const _UpdateSessionSE(this.session);
  

 final  Session session;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSessionSECopyWith<_UpdateSessionSE> get copyWith => __$UpdateSessionSECopyWithImpl<_UpdateSessionSE>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionEvent.updateSession'))
    ..add(DiagnosticsProperty('session', session));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSessionSE&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionEvent.updateSession(session: $session)';
}


}

/// @nodoc
abstract mixin class _$UpdateSessionSECopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$UpdateSessionSECopyWith(_UpdateSessionSE value, $Res Function(_UpdateSessionSE) _then) = __$UpdateSessionSECopyWithImpl;
@useResult
$Res call({
 Session session
});


$SessionCopyWith<$Res> get session;

}
/// @nodoc
class __$UpdateSessionSECopyWithImpl<$Res>
    implements _$UpdateSessionSECopyWith<$Res> {
  __$UpdateSessionSECopyWithImpl(this._self, this._then);

  final _UpdateSessionSE _self;
  final $Res Function(_UpdateSessionSE) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(_UpdateSessionSE(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,
  ));
}

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res> get session {
  
  return $SessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class _LogoutSE with DiagnosticableTreeMixin implements SessionEvent {
  const _LogoutSE();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionEvent.logout'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutSE);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionEvent.logout()';
}


}




/// @nodoc


class _UpdateTokensOnRefreshSE with DiagnosticableTreeMixin implements SessionEvent {
  const _UpdateTokensOnRefreshSE(this.completer);
  

 final  Completer<String?> completer;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTokensOnRefreshSECopyWith<_UpdateTokensOnRefreshSE> get copyWith => __$UpdateTokensOnRefreshSECopyWithImpl<_UpdateTokensOnRefreshSE>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionEvent.updateTokensOnRefresh'))
    ..add(DiagnosticsProperty('completer', completer));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTokensOnRefreshSE&&(identical(other.completer, completer) || other.completer == completer));
}


@override
int get hashCode => Object.hash(runtimeType,completer);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionEvent.updateTokensOnRefresh(completer: $completer)';
}


}

/// @nodoc
abstract mixin class _$UpdateTokensOnRefreshSECopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$UpdateTokensOnRefreshSECopyWith(_UpdateTokensOnRefreshSE value, $Res Function(_UpdateTokensOnRefreshSE) _then) = __$UpdateTokensOnRefreshSECopyWithImpl;
@useResult
$Res call({
 Completer<String?> completer
});




}
/// @nodoc
class __$UpdateTokensOnRefreshSECopyWithImpl<$Res>
    implements _$UpdateTokensOnRefreshSECopyWith<$Res> {
  __$UpdateTokensOnRefreshSECopyWithImpl(this._self, this._then);

  final _UpdateTokensOnRefreshSE _self;
  final $Res Function(_UpdateTokensOnRefreshSE) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? completer = null,}) {
  return _then(_UpdateTokensOnRefreshSE(
null == completer ? _self.completer : completer // ignore: cast_nullable_to_non_nullable
as Completer<String?>,
  ));
}


}

// dart format on
