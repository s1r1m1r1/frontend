// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fake_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FakeUser {

 String get email; String get password; User get user; Session? get session;
/// Create a copy of FakeUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FakeUserCopyWith<FakeUser> get copyWith => _$FakeUserCopyWithImpl<FakeUser>(this as FakeUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FakeUser&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.user, user) || other.user == user)&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,user,session);

@override
String toString() {
  return 'FakeUser(email: $email, password: $password, user: $user, session: $session)';
}


}

/// @nodoc
abstract mixin class $FakeUserCopyWith<$Res>  {
  factory $FakeUserCopyWith(FakeUser value, $Res Function(FakeUser) _then) = _$FakeUserCopyWithImpl;
@useResult
$Res call({
 String email, String password, User user, Session? session
});


$UserCopyWith<$Res> get user;$SessionCopyWith<$Res>? get session;

}
/// @nodoc
class _$FakeUserCopyWithImpl<$Res>
    implements $FakeUserCopyWith<$Res> {
  _$FakeUserCopyWithImpl(this._self, this._then);

  final FakeUser _self;
  final $Res Function(FakeUser) _then;

/// Create a copy of FakeUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? user = null,Object? session = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session?,
  ));
}
/// Create a copy of FakeUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of FakeUser
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


class _FakeUser extends FakeUser {
  const _FakeUser({required this.email, required this.password, required this.user, this.session}): super._();
  

@override final  String email;
@override final  String password;
@override final  User user;
@override final  Session? session;

/// Create a copy of FakeUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FakeUserCopyWith<_FakeUser> get copyWith => __$FakeUserCopyWithImpl<_FakeUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FakeUser&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.user, user) || other.user == user)&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,user,session);

@override
String toString() {
  return 'FakeUser(email: $email, password: $password, user: $user, session: $session)';
}


}

/// @nodoc
abstract mixin class _$FakeUserCopyWith<$Res> implements $FakeUserCopyWith<$Res> {
  factory _$FakeUserCopyWith(_FakeUser value, $Res Function(_FakeUser) _then) = __$FakeUserCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, User user, Session? session
});


@override $UserCopyWith<$Res> get user;@override $SessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$FakeUserCopyWithImpl<$Res>
    implements _$FakeUserCopyWith<$Res> {
  __$FakeUserCopyWithImpl(this._self, this._then);

  final _FakeUser _self;
  final $Res Function(_FakeUser) _then;

/// Create a copy of FakeUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? user = null,Object? session = freezed,}) {
  return _then(_FakeUser(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session?,
  ));
}

/// Create a copy of FakeUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of FakeUser
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

// dart format on
