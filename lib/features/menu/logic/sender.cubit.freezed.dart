// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sender.cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SenderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SenderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SenderState()';
}


}

/// @nodoc
class $SenderStateCopyWith<$Res>  {
$SenderStateCopyWith(SenderState _, $Res Function(SenderState) __);
}



/// @nodoc


class Initial_SenderS extends SenderState {
  const Initial_SenderS(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial_SenderS);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SenderState.initial()';
}


}




/// @nodoc


class Selected_SenderS extends SenderState {
  const Selected_SenderS(this.sender): super._();
  

 final  ISessionWS sender;

/// Create a copy of SenderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Selected_SenderSCopyWith<Selected_SenderS> get copyWith => _$Selected_SenderSCopyWithImpl<Selected_SenderS>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Selected_SenderS&&(identical(other.sender, sender) || other.sender == sender));
}


@override
int get hashCode => Object.hash(runtimeType,sender);

@override
String toString() {
  return 'SenderState.selected(sender: $sender)';
}


}

/// @nodoc
abstract mixin class $Selected_SenderSCopyWith<$Res> implements $SenderStateCopyWith<$Res> {
  factory $Selected_SenderSCopyWith(Selected_SenderS value, $Res Function(Selected_SenderS) _then) = _$Selected_SenderSCopyWithImpl;
@useResult
$Res call({
 ISessionWS sender
});




}
/// @nodoc
class _$Selected_SenderSCopyWithImpl<$Res>
    implements $Selected_SenderSCopyWith<$Res> {
  _$Selected_SenderSCopyWithImpl(this._self, this._then);

  final Selected_SenderS _self;
  final $Res Function(Selected_SenderS) _then;

/// Create a copy of SenderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sender = null,}) {
  return _then(Selected_SenderS(
null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as ISessionWS,
  ));
}


}

// dart format on
