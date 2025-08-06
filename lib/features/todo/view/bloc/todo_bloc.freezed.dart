// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoEvent()';
}


}

/// @nodoc
class $TodoEventCopyWith<$Res>  {
$TodoEventCopyWith(TodoEvent _, $Res Function(TodoEvent) __);
}


/// Adds pattern-matching-related methods to [TodoEvent].
extension TodoEventPatterns on TodoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTodosEvent value)?  loadTodos,TResult Function( AddTodoEvent value)?  addTodo,TResult Function( UpdateTodoEvent value)?  updateTodo,TResult Function( DeleteTodoEvent value)?  deleteTodo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTodosEvent() when loadTodos != null:
return loadTodos(_that);case AddTodoEvent() when addTodo != null:
return addTodo(_that);case UpdateTodoEvent() when updateTodo != null:
return updateTodo(_that);case DeleteTodoEvent() when deleteTodo != null:
return deleteTodo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTodosEvent value)  loadTodos,required TResult Function( AddTodoEvent value)  addTodo,required TResult Function( UpdateTodoEvent value)  updateTodo,required TResult Function( DeleteTodoEvent value)  deleteTodo,}){
final _that = this;
switch (_that) {
case LoadTodosEvent():
return loadTodos(_that);case AddTodoEvent():
return addTodo(_that);case UpdateTodoEvent():
return updateTodo(_that);case DeleteTodoEvent():
return deleteTodo(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTodosEvent value)?  loadTodos,TResult? Function( AddTodoEvent value)?  addTodo,TResult? Function( UpdateTodoEvent value)?  updateTodo,TResult? Function( DeleteTodoEvent value)?  deleteTodo,}){
final _that = this;
switch (_that) {
case LoadTodosEvent() when loadTodos != null:
return loadTodos(_that);case AddTodoEvent() when addTodo != null:
return addTodo(_that);case UpdateTodoEvent() when updateTodo != null:
return updateTodo(_that);case DeleteTodoEvent() when deleteTodo != null:
return deleteTodo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTodos,TResult Function( CreateTodo todo)?  addTodo,TResult Function( UpdateTodo todo)?  updateTodo,TResult Function( int id)?  deleteTodo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTodosEvent() when loadTodos != null:
return loadTodos();case AddTodoEvent() when addTodo != null:
return addTodo(_that.todo);case UpdateTodoEvent() when updateTodo != null:
return updateTodo(_that.todo);case DeleteTodoEvent() when deleteTodo != null:
return deleteTodo(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTodos,required TResult Function( CreateTodo todo)  addTodo,required TResult Function( UpdateTodo todo)  updateTodo,required TResult Function( int id)  deleteTodo,}) {final _that = this;
switch (_that) {
case LoadTodosEvent():
return loadTodos();case AddTodoEvent():
return addTodo(_that.todo);case UpdateTodoEvent():
return updateTodo(_that.todo);case DeleteTodoEvent():
return deleteTodo(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTodos,TResult? Function( CreateTodo todo)?  addTodo,TResult? Function( UpdateTodo todo)?  updateTodo,TResult? Function( int id)?  deleteTodo,}) {final _that = this;
switch (_that) {
case LoadTodosEvent() when loadTodos != null:
return loadTodos();case AddTodoEvent() when addTodo != null:
return addTodo(_that.todo);case UpdateTodoEvent() when updateTodo != null:
return updateTodo(_that.todo);case DeleteTodoEvent() when deleteTodo != null:
return deleteTodo(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class LoadTodosEvent extends TodoEvent {
  const LoadTodosEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTodosEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoEvent.loadTodos()';
}


}




/// @nodoc


class AddTodoEvent extends TodoEvent {
  const AddTodoEvent(this.todo): super._();
  

 final  CreateTodo todo;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTodoEventCopyWith<AddTodoEvent> get copyWith => _$AddTodoEventCopyWithImpl<AddTodoEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTodoEvent&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,todo);

@override
String toString() {
  return 'TodoEvent.addTodo(todo: $todo)';
}


}

/// @nodoc
abstract mixin class $AddTodoEventCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $AddTodoEventCopyWith(AddTodoEvent value, $Res Function(AddTodoEvent) _then) = _$AddTodoEventCopyWithImpl;
@useResult
$Res call({
 CreateTodo todo
});


$CreateTodoCopyWith<$Res> get todo;

}
/// @nodoc
class _$AddTodoEventCopyWithImpl<$Res>
    implements $AddTodoEventCopyWith<$Res> {
  _$AddTodoEventCopyWithImpl(this._self, this._then);

  final AddTodoEvent _self;
  final $Res Function(AddTodoEvent) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todo = null,}) {
  return _then(AddTodoEvent(
null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as CreateTodo,
  ));
}

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTodoCopyWith<$Res> get todo {
  
  return $CreateTodoCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

/// @nodoc


class UpdateTodoEvent extends TodoEvent {
  const UpdateTodoEvent(this.todo): super._();
  

 final  UpdateTodo todo;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTodoEventCopyWith<UpdateTodoEvent> get copyWith => _$UpdateTodoEventCopyWithImpl<UpdateTodoEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTodoEvent&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,todo);

@override
String toString() {
  return 'TodoEvent.updateTodo(todo: $todo)';
}


}

/// @nodoc
abstract mixin class $UpdateTodoEventCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $UpdateTodoEventCopyWith(UpdateTodoEvent value, $Res Function(UpdateTodoEvent) _then) = _$UpdateTodoEventCopyWithImpl;
@useResult
$Res call({
 UpdateTodo todo
});


$UpdateTodoCopyWith<$Res> get todo;

}
/// @nodoc
class _$UpdateTodoEventCopyWithImpl<$Res>
    implements $UpdateTodoEventCopyWith<$Res> {
  _$UpdateTodoEventCopyWithImpl(this._self, this._then);

  final UpdateTodoEvent _self;
  final $Res Function(UpdateTodoEvent) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todo = null,}) {
  return _then(UpdateTodoEvent(
null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as UpdateTodo,
  ));
}

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateTodoCopyWith<$Res> get todo {
  
  return $UpdateTodoCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

/// @nodoc


class DeleteTodoEvent extends TodoEvent {
  const DeleteTodoEvent(this.id): super._();
  

 final  int id;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTodoEventCopyWith<DeleteTodoEvent> get copyWith => _$DeleteTodoEventCopyWithImpl<DeleteTodoEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTodoEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TodoEvent.deleteTodo(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteTodoEventCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $DeleteTodoEventCopyWith(DeleteTodoEvent value, $Res Function(DeleteTodoEvent) _then) = _$DeleteTodoEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteTodoEventCopyWithImpl<$Res>
    implements $DeleteTodoEventCopyWith<$Res> {
  _$DeleteTodoEventCopyWithImpl(this._self, this._then);

  final DeleteTodoEvent _self;
  final $Res Function(DeleteTodoEvent) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteTodoEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TodoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoState()';
}


}

/// @nodoc
class $TodoStateCopyWith<$Res>  {
$TodoStateCopyWith(TodoState _, $Res Function(TodoState) __);
}


/// Adds pattern-matching-related methods to [TodoState].
extension TodoStatePatterns on TodoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TodoLoading value)?  loading,TResult Function( TodoLoaded value)?  loaded,TResult Function( TodoError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TodoLoading() when loading != null:
return loading(_that);case TodoLoaded() when loaded != null:
return loaded(_that);case TodoError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TodoLoading value)  loading,required TResult Function( TodoLoaded value)  loaded,required TResult Function( TodoError value)  error,}){
final _that = this;
switch (_that) {
case TodoLoading():
return loading(_that);case TodoLoaded():
return loaded(_that);case TodoError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TodoLoading value)?  loading,TResult? Function( TodoLoaded value)?  loaded,TResult? Function( TodoError value)?  error,}){
final _that = this;
switch (_that) {
case TodoLoading() when loading != null:
return loading(_that);case TodoLoaded() when loaded != null:
return loaded(_that);case TodoError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<Todo> todos)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TodoLoading() when loading != null:
return loading();case TodoLoaded() when loaded != null:
return loaded(_that.todos);case TodoError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<Todo> todos)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TodoLoading():
return loading();case TodoLoaded():
return loaded(_that.todos);case TodoError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<Todo> todos)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TodoLoading() when loading != null:
return loading();case TodoLoaded() when loaded != null:
return loaded(_that.todos);case TodoError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TodoLoading implements TodoState {
  const TodoLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoState.loading()';
}


}




/// @nodoc


class TodoLoaded implements TodoState {
  const TodoLoaded({required final  List<Todo> todos}): _todos = todos;
  

 final  List<Todo> _todos;
 List<Todo> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}


/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoLoadedCopyWith<TodoLoaded> get copyWith => _$TodoLoadedCopyWithImpl<TodoLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoLoaded&&const DeepCollectionEquality().equals(other._todos, _todos));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_todos));

@override
String toString() {
  return 'TodoState.loaded(todos: $todos)';
}


}

/// @nodoc
abstract mixin class $TodoLoadedCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory $TodoLoadedCopyWith(TodoLoaded value, $Res Function(TodoLoaded) _then) = _$TodoLoadedCopyWithImpl;
@useResult
$Res call({
 List<Todo> todos
});




}
/// @nodoc
class _$TodoLoadedCopyWithImpl<$Res>
    implements $TodoLoadedCopyWith<$Res> {
  _$TodoLoadedCopyWithImpl(this._self, this._then);

  final TodoLoaded _self;
  final $Res Function(TodoLoaded) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todos = null,}) {
  return _then(TodoLoaded(
todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<Todo>,
  ));
}


}

/// @nodoc


class TodoError implements TodoState {
  const TodoError({required this.message});
  

 final  String message;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoErrorCopyWith<TodoError> get copyWith => _$TodoErrorCopyWithImpl<TodoError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TodoState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TodoErrorCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory $TodoErrorCopyWith(TodoError value, $Res Function(TodoError) _then) = _$TodoErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TodoErrorCopyWithImpl<$Res>
    implements $TodoErrorCopyWith<$Res> {
  _$TodoErrorCopyWithImpl(this._self, this._then);

  final TodoError _self;
  final $Res Function(TodoError) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TodoError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
