// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}



/// @nodoc


class InitialAuthState extends AuthState with DiagnosticableTreeMixin {
  const InitialAuthState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthenticatedAuthState extends AuthState with DiagnosticableTreeMixin {
  const AuthenticatedAuthState({required this.session, this.isUpdating = false, this.errorMessage}): super._();
  

 final  Session session;
@JsonKey() final  bool isUpdating;
 final  String? errorMessage;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedAuthStateCopyWith<AuthenticatedAuthState> get copyWith => _$AuthenticatedAuthStateCopyWithImpl<AuthenticatedAuthState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.authenticated'))
    ..add(DiagnosticsProperty('session', session))..add(DiagnosticsProperty('isUpdating', isUpdating))..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedAuthState&&(identical(other.session, session) || other.session == session)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,session,isUpdating,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.authenticated(session: $session, isUpdating: $isUpdating, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedAuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedAuthStateCopyWith(AuthenticatedAuthState value, $Res Function(AuthenticatedAuthState) _then) = _$AuthenticatedAuthStateCopyWithImpl;
@useResult
$Res call({
 Session session, bool isUpdating, String? errorMessage
});


$SessionCopyWith<$Res> get session;

}
/// @nodoc
class _$AuthenticatedAuthStateCopyWithImpl<$Res>
    implements $AuthenticatedAuthStateCopyWith<$Res> {
  _$AuthenticatedAuthStateCopyWithImpl(this._self, this._then);

  final AuthenticatedAuthState _self;
  final $Res Function(AuthenticatedAuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? isUpdating = null,Object? errorMessage = freezed,}) {
  return _then(AuthenticatedAuthState(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthState
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


class LogoutAuthState extends AuthState with DiagnosticableTreeMixin {
  const LogoutAuthState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.logout'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutAuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.logout()';
}


}




// dart format on
