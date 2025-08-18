// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_stage.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppStageEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStageEvent()';
}


}

/// @nodoc
class $AppStageEventCopyWith<$Res>  {
$AppStageEventCopyWith(AppStageEvent _, $Res Function(AppStageEvent) __);
}


/// Adds pattern-matching-related methods to [AppStageEvent].
extension AppStageEventPatterns on AppStageEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StartedEvent value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartedEvent() when started != null:
return started(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StartedEvent value)  started,}){
final _that = this;
switch (_that) {
case _StartedEvent():
return started(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StartedEvent value)?  started,}){
final _that = this;
switch (_that) {
case _StartedEvent() when started != null:
return started(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartedEvent() when started != null:
return started();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,}) {final _that = this;
switch (_that) {
case _StartedEvent():
return started();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,}) {final _that = this;
switch (_that) {
case _StartedEvent() when started != null:
return started();case _:
  return null;

}
}

}

/// @nodoc


class _StartedEvent extends AppStageEvent {
  const _StartedEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStageEvent.started()';
}


}




/// @nodoc
mixin _$AppStageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStageState()';
}


}

/// @nodoc
class $AppStageStateCopyWith<$Res>  {
$AppStageStateCopyWith(AppStageState _, $Res Function(AppStageState) __);
}


/// Adds pattern-matching-related methods to [AppStageState].
extension AppStageStatePatterns on AppStageState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial_AS value)?  initial,TResult Function( Loading_AS value)?  loading,TResult Function( Success_AS value)?  success,TResult Function( Failure_AS value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial_AS() when initial != null:
return initial(_that);case Loading_AS() when loading != null:
return loading(_that);case Success_AS() when success != null:
return success(_that);case Failure_AS() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial_AS value)  initial,required TResult Function( Loading_AS value)  loading,required TResult Function( Success_AS value)  success,required TResult Function( Failure_AS value)  failure,}){
final _that = this;
switch (_that) {
case Initial_AS():
return initial(_that);case Loading_AS():
return loading(_that);case Success_AS():
return success(_that);case Failure_AS():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial_AS value)?  initial,TResult? Function( Loading_AS value)?  loading,TResult? Function( Success_AS value)?  success,TResult? Function( Failure_AS value)?  failure,}){
final _that = this;
switch (_that) {
case Initial_AS() when initial != null:
return initial(_that);case Loading_AS() when loading != null:
return loading(_that);case Success_AS() when success != null:
return success(_that);case Failure_AS() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial_AS() when initial != null:
return initial();case Loading_AS() when loading != null:
return loading();case Success_AS() when success != null:
return success();case Failure_AS() when failure != null:
return failure();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  failure,}) {final _that = this;
switch (_that) {
case Initial_AS():
return initial();case Loading_AS():
return loading();case Success_AS():
return success();case Failure_AS():
return failure();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  failure,}) {final _that = this;
switch (_that) {
case Initial_AS() when initial != null:
return initial();case Loading_AS() when loading != null:
return loading();case Success_AS() when success != null:
return success();case Failure_AS() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class Initial_AS extends AppStageState {
  const Initial_AS(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial_AS);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStageState.initial()';
}


}




/// @nodoc


class Loading_AS extends AppStageState {
  const Loading_AS(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading_AS);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStageState.loading()';
}


}




/// @nodoc


class Success_AS extends AppStageState {
  const Success_AS(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success_AS);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStageState.success()';
}


}




/// @nodoc


class Failure_AS extends AppStageState {
  const Failure_AS(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure_AS);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStageState.failure()';
}


}




// dart format on
