// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'joined_broadcast_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JoinedBroadcastState implements DiagnosticableTreeMixin {

 List<BroadcastId> get joinedBroads;
/// Create a copy of JoinedBroadcastState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinedBroadcastStateCopyWith<JoinedBroadcastState> get copyWith => _$JoinedBroadcastStateCopyWithImpl<JoinedBroadcastState>(this as JoinedBroadcastState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JoinedBroadcastState'))
    ..add(DiagnosticsProperty('joinedBroads', joinedBroads));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinedBroadcastState&&const DeepCollectionEquality().equals(other.joinedBroads, joinedBroads));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(joinedBroads));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JoinedBroadcastState(joinedBroads: $joinedBroads)';
}


}

/// @nodoc
abstract mixin class $JoinedBroadcastStateCopyWith<$Res>  {
  factory $JoinedBroadcastStateCopyWith(JoinedBroadcastState value, $Res Function(JoinedBroadcastState) _then) = _$JoinedBroadcastStateCopyWithImpl;
@useResult
$Res call({
 List<BroadcastId> joinedBroads
});




}
/// @nodoc
class _$JoinedBroadcastStateCopyWithImpl<$Res>
    implements $JoinedBroadcastStateCopyWith<$Res> {
  _$JoinedBroadcastStateCopyWithImpl(this._self, this._then);

  final JoinedBroadcastState _self;
  final $Res Function(JoinedBroadcastState) _then;

/// Create a copy of JoinedBroadcastState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? joinedBroads = null,}) {
  return _then(_self.copyWith(
joinedBroads: null == joinedBroads ? _self.joinedBroads : joinedBroads // ignore: cast_nullable_to_non_nullable
as List<BroadcastId>,
  ));
}

}



/// @nodoc


class _JoinedBroadcastState with DiagnosticableTreeMixin implements JoinedBroadcastState {
  const _JoinedBroadcastState(final  List<BroadcastId> joinedBroads): _joinedBroads = joinedBroads;
  

 final  List<BroadcastId> _joinedBroads;
@override List<BroadcastId> get joinedBroads {
  if (_joinedBroads is EqualUnmodifiableListView) return _joinedBroads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_joinedBroads);
}


/// Create a copy of JoinedBroadcastState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinedBroadcastStateCopyWith<_JoinedBroadcastState> get copyWith => __$JoinedBroadcastStateCopyWithImpl<_JoinedBroadcastState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JoinedBroadcastState'))
    ..add(DiagnosticsProperty('joinedBroads', joinedBroads));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinedBroadcastState&&const DeepCollectionEquality().equals(other._joinedBroads, _joinedBroads));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_joinedBroads));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JoinedBroadcastState(joinedBroads: $joinedBroads)';
}


}

/// @nodoc
abstract mixin class _$JoinedBroadcastStateCopyWith<$Res> implements $JoinedBroadcastStateCopyWith<$Res> {
  factory _$JoinedBroadcastStateCopyWith(_JoinedBroadcastState value, $Res Function(_JoinedBroadcastState) _then) = __$JoinedBroadcastStateCopyWithImpl;
@override @useResult
$Res call({
 List<BroadcastId> joinedBroads
});




}
/// @nodoc
class __$JoinedBroadcastStateCopyWithImpl<$Res>
    implements _$JoinedBroadcastStateCopyWith<$Res> {
  __$JoinedBroadcastStateCopyWithImpl(this._self, this._then);

  final _JoinedBroadcastState _self;
  final $Res Function(_JoinedBroadcastState) _then;

/// Create a copy of JoinedBroadcastState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? joinedBroads = null,}) {
  return _then(_JoinedBroadcastState(
null == joinedBroads ? _self._joinedBroads : joinedBroads // ignore: cast_nullable_to_non_nullable
as List<BroadcastId>,
  ));
}


}

// dart format on
