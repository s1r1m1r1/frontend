// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fake_user.cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FakeUserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FakeUserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FakeUserState()';
}


}

/// @nodoc
class $FakeUserStateCopyWith<$Res>  {
$FakeUserStateCopyWith(FakeUserState _, $Res Function(FakeUserState) __);
}



/// @nodoc


class Initial_FakeS extends FakeUserState {
  const Initial_FakeS(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial_FakeS);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FakeUserState.initial()';
}


}




/// @nodoc


class Selected_FakeS extends FakeUserState {
  const Selected_FakeS(this.id): super._();
  

 final  String id;

/// Create a copy of FakeUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Selected_FakeSCopyWith<Selected_FakeS> get copyWith => _$Selected_FakeSCopyWithImpl<Selected_FakeS>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Selected_FakeS&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FakeUserState.selected(id: $id)';
}


}

/// @nodoc
abstract mixin class $Selected_FakeSCopyWith<$Res> implements $FakeUserStateCopyWith<$Res> {
  factory $Selected_FakeSCopyWith(Selected_FakeS value, $Res Function(Selected_FakeS) _then) = _$Selected_FakeSCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$Selected_FakeSCopyWithImpl<$Res>
    implements $Selected_FakeSCopyWith<$Res> {
  _$Selected_FakeSCopyWithImpl(this._self, this._then);

  final Selected_FakeS _self;
  final $Res Function(Selected_FakeS) _then;

/// Create a copy of FakeUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(Selected_FakeS(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
