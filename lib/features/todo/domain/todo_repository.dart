import 'package:frontend/core/network/with_token_api.dart';
import 'package:frontend/features/todo/data/todo_dto.dart';
import 'package:frontend/features/todo/data/update_todo_dto.dart';
import 'package:injectable/injectable.dart';

import '../data/create_todo_dto.dart';
import 'create_todo.dart';
import 'todo.dart';
import 'update_todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<Todo> createTodo(CreateTodo todo);
  Future<Todo> updateTodo(UpdateTodo todo);
  Future<void> deleteTodo(int todoId);
}

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final WithTokenApi _apiService;
  TodoRepositoryImpl(this._apiService);

  @override
  Future<List<Todo>> getTodos() async {
    final response = await _apiService.fetchTodos();
    final list = response.body?.map((dto) => dto.toModel()).toList();
    if (list == null) throw Exception('Failed to load todos');
    return list;
  }

  @override
  Future<Todo> createTodo(CreateTodo todo) async {
    final response = await _apiService.createTodo(todo.toDto());
    final model = response.body?.toModel();
    if (model == null) throw Exception('Failed to create todo');
    return model;
  }

  @override
  Future<bool> deleteTodo(int todoId) async {
    final resp = await _apiService.deleteTodo(todoId);
    return true;
  }

  @override
  Future<Todo> updateTodo(UpdateTodo todo) async {
    final resp = await _apiService.updateTodo(todo.id, todo.toDto());
    final model = resp.body?.toModel();
    if (model == null) throw Exception('Failed to update todo');
    return model;
  }
}
