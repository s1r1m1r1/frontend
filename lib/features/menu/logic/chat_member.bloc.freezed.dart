// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_member.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatMemberEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatMemberEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMemberEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatMemberEvent()';
}


}

/// @nodoc
class $ChatMemberEventCopyWith<$Res>  {
$ChatMemberEventCopyWith(ChatMemberEvent _, $Res Function(ChatMemberEvent) __);
}



/// @nodoc


class _StartedEvent with DiagnosticableTreeMixin implements ChatMemberEvent {
  const _StartedEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatMemberEvent.started'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatMemberEvent.started()';
}


}




/// @nodoc


class _SubscribeEvent with DiagnosticableTreeMixin implements ChatMemberEvent {
  const _SubscribeEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatMemberEvent.subscribe'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscribeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatMemberEvent.subscribe()';
}


}




/// @nodoc


class _JoinMainEvent with DiagnosticableTreeMixin implements ChatMemberEvent {
  const _JoinMainEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatMemberEvent.joinMain'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinMainEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatMemberEvent.joinMain()';
}


}




/// @nodoc


class _MembersUpdatedEvent with DiagnosticableTreeMixin implements ChatMemberEvent {
  const _MembersUpdatedEvent(final  List<OnlineMemberDto> memberIds): _memberIds = memberIds;
  

 final  List<OnlineMemberDto> _memberIds;
 List<OnlineMemberDto> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}


/// Create a copy of ChatMemberEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembersUpdatedEventCopyWith<_MembersUpdatedEvent> get copyWith => __$MembersUpdatedEventCopyWithImpl<_MembersUpdatedEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatMemberEvent.membersUpdated'))
    ..add(DiagnosticsProperty('memberIds', memberIds));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MembersUpdatedEvent&&const DeepCollectionEquality().equals(other._memberIds, _memberIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_memberIds));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatMemberEvent.membersUpdated(memberIds: $memberIds)';
}


}

/// @nodoc
abstract mixin class _$MembersUpdatedEventCopyWith<$Res> implements $ChatMemberEventCopyWith<$Res> {
  factory _$MembersUpdatedEventCopyWith(_MembersUpdatedEvent value, $Res Function(_MembersUpdatedEvent) _then) = __$MembersUpdatedEventCopyWithImpl;
@useResult
$Res call({
 List<OnlineMemberDto> memberIds
});




}
/// @nodoc
class __$MembersUpdatedEventCopyWithImpl<$Res>
    implements _$MembersUpdatedEventCopyWith<$Res> {
  __$MembersUpdatedEventCopyWithImpl(this._self, this._then);

  final _MembersUpdatedEvent _self;
  final $Res Function(_MembersUpdatedEvent) _then;

/// Create a copy of ChatMemberEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? memberIds = null,}) {
  return _then(_MembersUpdatedEvent(
null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<OnlineMemberDto>,
  ));
}


}

// dart format on
