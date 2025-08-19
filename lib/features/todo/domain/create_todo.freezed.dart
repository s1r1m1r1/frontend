// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTodo {

 String get title; String get description;
/// Create a copy of CreateTodo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTodoCopyWith<CreateTodo> get copyWith => _$CreateTodoCopyWithImpl<CreateTodo>(this as CreateTodo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTodo&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'CreateTodo(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateTodoCopyWith<$Res>  {
  factory $CreateTodoCopyWith(CreateTodo value, $Res Function(CreateTodo) _then) = _$CreateTodoCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class _$CreateTodoCopyWithImpl<$Res>
    implements $CreateTodoCopyWith<$Res> {
  _$CreateTodoCopyWithImpl(this._self, this._then);

  final CreateTodo _self;
  final $Res Function(CreateTodo) _then;

/// Create a copy of CreateTodo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



/// @nodoc


class _CreateTodo extends CreateTodo {
  const _CreateTodo({required this.title, this.description = 'test'}): super._();
  

@override final  String title;
@override@JsonKey() final  String description;

/// Create a copy of CreateTodo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTodoCopyWith<_CreateTodo> get copyWith => __$CreateTodoCopyWithImpl<_CreateTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTodo&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'CreateTodo(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateTodoCopyWith<$Res> implements $CreateTodoCopyWith<$Res> {
  factory _$CreateTodoCopyWith(_CreateTodo value, $Res Function(_CreateTodo) _then) = __$CreateTodoCopyWithImpl;
@override @useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class __$CreateTodoCopyWithImpl<$Res>
    implements _$CreateTodoCopyWith<$Res> {
  __$CreateTodoCopyWithImpl(this._self, this._then);

  final _CreateTodo _self;
  final $Res Function(_CreateTodo) _then;

/// Create a copy of CreateTodo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(_CreateTodo(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
