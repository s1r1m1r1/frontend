// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin.cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminState {

 int get connectionCount; Session? get adminSession; Session? get fakeSession; FakeUser? get selectedFakeUser; List<FakeUser> get fakes;
/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminStateCopyWith<AdminState> get copyWith => _$AdminStateCopyWithImpl<AdminState>(this as AdminState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminState&&(identical(other.connectionCount, connectionCount) || other.connectionCount == connectionCount)&&(identical(other.adminSession, adminSession) || other.adminSession == adminSession)&&(identical(other.fakeSession, fakeSession) || other.fakeSession == fakeSession)&&(identical(other.selectedFakeUser, selectedFakeUser) || other.selectedFakeUser == selectedFakeUser)&&const DeepCollectionEquality().equals(other.fakes, fakes));
}


@override
int get hashCode => Object.hash(runtimeType,connectionCount,adminSession,fakeSession,selectedFakeUser,const DeepCollectionEquality().hash(fakes));

@override
String toString() {
  return 'AdminState(connectionCount: $connectionCount, adminSession: $adminSession, fakeSession: $fakeSession, selectedFakeUser: $selectedFakeUser, fakes: $fakes)';
}


}

/// @nodoc
abstract mixin class $AdminStateCopyWith<$Res>  {
  factory $AdminStateCopyWith(AdminState value, $Res Function(AdminState) _then) = _$AdminStateCopyWithImpl;
@useResult
$Res call({
 int connectionCount, Session? adminSession, Session? fakeSession, FakeUser? selectedFakeUser, List<FakeUser> fakes
});


$SessionCopyWith<$Res>? get adminSession;$SessionCopyWith<$Res>? get fakeSession;$FakeUserCopyWith<$Res>? get selectedFakeUser;

}
/// @nodoc
class _$AdminStateCopyWithImpl<$Res>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._self, this._then);

  final AdminState _self;
  final $Res Function(AdminState) _then;

/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionCount = null,Object? adminSession = freezed,Object? fakeSession = freezed,Object? selectedFakeUser = freezed,Object? fakes = null,}) {
  return _then(_self.copyWith(
connectionCount: null == connectionCount ? _self.connectionCount : connectionCount // ignore: cast_nullable_to_non_nullable
as int,adminSession: freezed == adminSession ? _self.adminSession : adminSession // ignore: cast_nullable_to_non_nullable
as Session?,fakeSession: freezed == fakeSession ? _self.fakeSession : fakeSession // ignore: cast_nullable_to_non_nullable
as Session?,selectedFakeUser: freezed == selectedFakeUser ? _self.selectedFakeUser : selectedFakeUser // ignore: cast_nullable_to_non_nullable
as FakeUser?,fakes: null == fakes ? _self.fakes : fakes // ignore: cast_nullable_to_non_nullable
as List<FakeUser>,
  ));
}
/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get adminSession {
    if (_self.adminSession == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.adminSession!, (value) {
    return _then(_self.copyWith(adminSession: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get fakeSession {
    if (_self.fakeSession == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.fakeSession!, (value) {
    return _then(_self.copyWith(fakeSession: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FakeUserCopyWith<$Res>? get selectedFakeUser {
    if (_self.selectedFakeUser == null) {
    return null;
  }

  return $FakeUserCopyWith<$Res>(_self.selectedFakeUser!, (value) {
    return _then(_self.copyWith(selectedFakeUser: value));
  });
}
}



/// @nodoc


class _AdminState extends AdminState {
  const _AdminState({this.connectionCount = 0, this.adminSession, this.fakeSession, this.selectedFakeUser, final  List<FakeUser> fakes = const []}): _fakes = fakes,super._();
  

@override@JsonKey() final  int connectionCount;
@override final  Session? adminSession;
@override final  Session? fakeSession;
@override final  FakeUser? selectedFakeUser;
 final  List<FakeUser> _fakes;
@override@JsonKey() List<FakeUser> get fakes {
  if (_fakes is EqualUnmodifiableListView) return _fakes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fakes);
}


/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminStateCopyWith<_AdminState> get copyWith => __$AdminStateCopyWithImpl<_AdminState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminState&&(identical(other.connectionCount, connectionCount) || other.connectionCount == connectionCount)&&(identical(other.adminSession, adminSession) || other.adminSession == adminSession)&&(identical(other.fakeSession, fakeSession) || other.fakeSession == fakeSession)&&(identical(other.selectedFakeUser, selectedFakeUser) || other.selectedFakeUser == selectedFakeUser)&&const DeepCollectionEquality().equals(other._fakes, _fakes));
}


@override
int get hashCode => Object.hash(runtimeType,connectionCount,adminSession,fakeSession,selectedFakeUser,const DeepCollectionEquality().hash(_fakes));

@override
String toString() {
  return 'AdminState(connectionCount: $connectionCount, adminSession: $adminSession, fakeSession: $fakeSession, selectedFakeUser: $selectedFakeUser, fakes: $fakes)';
}


}

/// @nodoc
abstract mixin class _$AdminStateCopyWith<$Res> implements $AdminStateCopyWith<$Res> {
  factory _$AdminStateCopyWith(_AdminState value, $Res Function(_AdminState) _then) = __$AdminStateCopyWithImpl;
@override @useResult
$Res call({
 int connectionCount, Session? adminSession, Session? fakeSession, FakeUser? selectedFakeUser, List<FakeUser> fakes
});


@override $SessionCopyWith<$Res>? get adminSession;@override $SessionCopyWith<$Res>? get fakeSession;@override $FakeUserCopyWith<$Res>? get selectedFakeUser;

}
/// @nodoc
class __$AdminStateCopyWithImpl<$Res>
    implements _$AdminStateCopyWith<$Res> {
  __$AdminStateCopyWithImpl(this._self, this._then);

  final _AdminState _self;
  final $Res Function(_AdminState) _then;

/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionCount = null,Object? adminSession = freezed,Object? fakeSession = freezed,Object? selectedFakeUser = freezed,Object? fakes = null,}) {
  return _then(_AdminState(
connectionCount: null == connectionCount ? _self.connectionCount : connectionCount // ignore: cast_nullable_to_non_nullable
as int,adminSession: freezed == adminSession ? _self.adminSession : adminSession // ignore: cast_nullable_to_non_nullable
as Session?,fakeSession: freezed == fakeSession ? _self.fakeSession : fakeSession // ignore: cast_nullable_to_non_nullable
as Session?,selectedFakeUser: freezed == selectedFakeUser ? _self.selectedFakeUser : selectedFakeUser // ignore: cast_nullable_to_non_nullable
as FakeUser?,fakes: null == fakes ? _self._fakes : fakes // ignore: cast_nullable_to_non_nullable
as List<FakeUser>,
  ));
}

/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get adminSession {
    if (_self.adminSession == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.adminSession!, (value) {
    return _then(_self.copyWith(adminSession: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get fakeSession {
    if (_self.fakeSession == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.fakeSession!, (value) {
    return _then(_self.copyWith(fakeSession: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FakeUserCopyWith<$Res>? get selectedFakeUser {
    if (_self.selectedFakeUser == null) {
    return null;
  }

  return $FakeUserCopyWith<$Res>(_self.selectedFakeUser!, (value) {
    return _then(_self.copyWith(selectedFakeUser: value));
  });
}
}

// dart format on
