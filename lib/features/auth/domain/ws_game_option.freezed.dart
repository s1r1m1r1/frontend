// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_game_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WsGameOption {

 String get mainRoomId;
/// Create a copy of WsGameOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsGameOptionCopyWith<WsGameOption> get copyWith => _$WsGameOptionCopyWithImpl<WsGameOption>(this as WsGameOption, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsGameOption&&(identical(other.mainRoomId, mainRoomId) || other.mainRoomId == mainRoomId));
}


@override
int get hashCode => Object.hash(runtimeType,mainRoomId);

@override
String toString() {
  return 'WsGameOption(mainRoomId: $mainRoomId)';
}


}

/// @nodoc
abstract mixin class $WsGameOptionCopyWith<$Res>  {
  factory $WsGameOptionCopyWith(WsGameOption value, $Res Function(WsGameOption) _then) = _$WsGameOptionCopyWithImpl;
@useResult
$Res call({
 String mainRoomId
});




}
/// @nodoc
class _$WsGameOptionCopyWithImpl<$Res>
    implements $WsGameOptionCopyWith<$Res> {
  _$WsGameOptionCopyWithImpl(this._self, this._then);

  final WsGameOption _self;
  final $Res Function(WsGameOption) _then;

/// Create a copy of WsGameOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mainRoomId = null,}) {
  return _then(_self.copyWith(
mainRoomId: null == mainRoomId ? _self.mainRoomId : mainRoomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



/// @nodoc


class _WsSettings implements WsGameOption {
  const _WsSettings({required this.mainRoomId});
  

@override final  String mainRoomId;

/// Create a copy of WsGameOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsSettingsCopyWith<_WsSettings> get copyWith => __$WsSettingsCopyWithImpl<_WsSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsSettings&&(identical(other.mainRoomId, mainRoomId) || other.mainRoomId == mainRoomId));
}


@override
int get hashCode => Object.hash(runtimeType,mainRoomId);

@override
String toString() {
  return 'WsGameOption(mainRoomId: $mainRoomId)';
}


}

/// @nodoc
abstract mixin class _$WsSettingsCopyWith<$Res> implements $WsGameOptionCopyWith<$Res> {
  factory _$WsSettingsCopyWith(_WsSettings value, $Res Function(_WsSettings) _then) = __$WsSettingsCopyWithImpl;
@override @useResult
$Res call({
 String mainRoomId
});




}
/// @nodoc
class __$WsSettingsCopyWithImpl<$Res>
    implements _$WsSettingsCopyWith<$Res> {
  __$WsSettingsCopyWithImpl(this._self, this._then);

  final _WsSettings _self;
  final $Res Function(_WsSettings) _then;

/// Create a copy of WsGameOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mainRoomId = null,}) {
  return _then(_WsSettings(
mainRoomId: null == mainRoomId ? _self.mainRoomId : mainRoomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
