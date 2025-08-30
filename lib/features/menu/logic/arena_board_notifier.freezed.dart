// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arena_board_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArenaBoardState {

 List<EdictDto> get edicts;
/// Create a copy of ArenaBoardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArenaBoardStateCopyWith<ArenaBoardState> get copyWith => _$ArenaBoardStateCopyWithImpl<ArenaBoardState>(this as ArenaBoardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArenaBoardState&&const DeepCollectionEquality().equals(other.edicts, edicts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(edicts));

@override
String toString() {
  return 'ArenaBoardState(edicts: $edicts)';
}


}

/// @nodoc
abstract mixin class $ArenaBoardStateCopyWith<$Res>  {
  factory $ArenaBoardStateCopyWith(ArenaBoardState value, $Res Function(ArenaBoardState) _then) = _$ArenaBoardStateCopyWithImpl;
@useResult
$Res call({
 List<EdictDto> edicts
});




}
/// @nodoc
class _$ArenaBoardStateCopyWithImpl<$Res>
    implements $ArenaBoardStateCopyWith<$Res> {
  _$ArenaBoardStateCopyWithImpl(this._self, this._then);

  final ArenaBoardState _self;
  final $Res Function(ArenaBoardState) _then;

/// Create a copy of ArenaBoardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? edicts = null,}) {
  return _then(_self.copyWith(
edicts: null == edicts ? _self.edicts : edicts // ignore: cast_nullable_to_non_nullable
as List<EdictDto>,
  ));
}

}



/// @nodoc


class _ArenaBoardState extends ArenaBoardState {
  const _ArenaBoardState({required final  List<EdictDto> edicts}): _edicts = edicts,super._();
  

 final  List<EdictDto> _edicts;
@override List<EdictDto> get edicts {
  if (_edicts is EqualUnmodifiableListView) return _edicts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_edicts);
}


/// Create a copy of ArenaBoardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArenaBoardStateCopyWith<_ArenaBoardState> get copyWith => __$ArenaBoardStateCopyWithImpl<_ArenaBoardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArenaBoardState&&const DeepCollectionEquality().equals(other._edicts, _edicts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_edicts));

@override
String toString() {
  return 'ArenaBoardState(edicts: $edicts)';
}


}

/// @nodoc
abstract mixin class _$ArenaBoardStateCopyWith<$Res> implements $ArenaBoardStateCopyWith<$Res> {
  factory _$ArenaBoardStateCopyWith(_ArenaBoardState value, $Res Function(_ArenaBoardState) _then) = __$ArenaBoardStateCopyWithImpl;
@override @useResult
$Res call({
 List<EdictDto> edicts
});




}
/// @nodoc
class __$ArenaBoardStateCopyWithImpl<$Res>
    implements _$ArenaBoardStateCopyWith<$Res> {
  __$ArenaBoardStateCopyWithImpl(this._self, this._then);

  final _ArenaBoardState _self;
  final $Res Function(_ArenaBoardState) _then;

/// Create a copy of ArenaBoardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? edicts = null,}) {
  return _then(_ArenaBoardState(
edicts: null == edicts ? _self._edicts : edicts // ignore: cast_nullable_to_non_nullable
as List<EdictDto>,
  ));
}


}

// dart format on
