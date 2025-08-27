// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupEvent {

 String get email; String get password;
/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupEventCopyWith<SignupEvent> get copyWith => _$SignupEventCopyWithImpl<SignupEvent>(this as SignupEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SignupEvent(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupEventCopyWith<$Res>  {
  factory $SignupEventCopyWith(SignupEvent value, $Res Function(SignupEvent) _then) = _$SignupEventCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$SignupEventCopyWithImpl<$Res>
    implements $SignupEventCopyWith<$Res> {
  _$SignupEventCopyWithImpl(this._self, this._then);

  final SignupEvent _self;
  final $Res Function(SignupEvent) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



/// @nodoc


class _SubmitPressedSE implements SignupEvent {
  const _SubmitPressedSE({required this.email, required this.password});
  

@override final  String email;
@override final  String password;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitPressedSECopyWith<_SubmitPressedSE> get copyWith => __$SubmitPressedSECopyWithImpl<_SubmitPressedSE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitPressedSE&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SignupEvent.submitPressed(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SubmitPressedSECopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$SubmitPressedSECopyWith(_SubmitPressedSE value, $Res Function(_SubmitPressedSE) _then) = __$SubmitPressedSECopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$SubmitPressedSECopyWithImpl<$Res>
    implements _$SubmitPressedSECopyWith<$Res> {
  __$SubmitPressedSECopyWithImpl(this._self, this._then);

  final _SubmitPressedSE _self;
  final $Res Function(_SubmitPressedSE) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_SubmitPressedSE(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SignupState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState()';
}


}

/// @nodoc
class $SignupStateCopyWith<$Res>  {
$SignupStateCopyWith(SignupState _, $Res Function(SignupState) __);
}



/// @nodoc


class SignupInitial extends SignupState {
  const SignupInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.initial()';
}


}




/// @nodoc


class SignupLoading extends SignupState {
  const SignupLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.loading()';
}


}




/// @nodoc


class SignupSuccess extends SignupState {
  const SignupSuccess(this.session): super._();
  

 final  Session session;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupSuccessCopyWith<SignupSuccess> get copyWith => _$SignupSuccessCopyWithImpl<SignupSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupSuccess&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'SignupState.success(session: $session)';
}


}

/// @nodoc
abstract mixin class $SignupSuccessCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupSuccessCopyWith(SignupSuccess value, $Res Function(SignupSuccess) _then) = _$SignupSuccessCopyWithImpl;
@useResult
$Res call({
 Session session
});


$SessionCopyWith<$Res> get session;

}
/// @nodoc
class _$SignupSuccessCopyWithImpl<$Res>
    implements $SignupSuccessCopyWith<$Res> {
  _$SignupSuccessCopyWithImpl(this._self, this._then);

  final SignupSuccess _self;
  final $Res Function(SignupSuccess) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(SignupSuccess(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,
  ));
}

/// Create a copy of SignupState
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


class SignupFailure extends SignupState {
  const SignupFailure(this.error): super._();
  

 final  SignupError error;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupFailureCopyWith<SignupFailure> get copyWith => _$SignupFailureCopyWithImpl<SignupFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SignupState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SignupFailureCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupFailureCopyWith(SignupFailure value, $Res Function(SignupFailure) _then) = _$SignupFailureCopyWithImpl;
@useResult
$Res call({
 SignupError error
});




}
/// @nodoc
class _$SignupFailureCopyWithImpl<$Res>
    implements $SignupFailureCopyWith<$Res> {
  _$SignupFailureCopyWithImpl(this._self, this._then);

  final SignupFailure _self;
  final $Res Function(SignupFailure) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SignupFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as SignupError,
  ));
}


}

// dart format on
