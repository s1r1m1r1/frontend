import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

@lazySingleton
class ProtectedApiService {
  final Dio _client;
  const ProtectedApiService(@Named('withToken') this._client);
  Future<ListUnitDto?> fetchListUnit() async {
    final response = await _client.get('/game/unit');
    if (response.statusCode == 200) {
      return ListUnitDto.fromJson(response.data);
    } else if (response.statusCode == 204) {
      return null;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<UnitDto> createUnit(CreateUnitDto dto) async {
    final response = await _client.post(
      '/game/unit',
      data: json.encode(dto.toJson()),
    );
    if (response.statusCode == 200) {
      return UnitDto.fromJson(response.data);
    } else {
      throw Exception('Failed to create todo');
    }
  }

  Future<UnitDto> updateUnit(UpdateUnitDto dto) async {
    debugPrint('start update');
    final response = await _client.put(
      '/game/unit/${dto.id}',
      data: json.encode(dto.toJson()),
    );
    if (response.statusCode != 200) {
      debugPrint('start not 200');
      throw Exception('Failed to update todo');
    }

    debugPrint('start good ${response.data}');
    return UnitDto.fromJson(response.data);
  }

  Future<bool> deleteUnit(int id) async {
    final response = await _client.delete('/game/unit/$id');
    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    }
    return false;
  }

  Future<UnitDto?> setSelectedUnit({required int unitId}) async {
    final response = await _client.post('/game/selected-unit/$unitId');
    debugPrint("SetSelected JSON ${response.data} ${response.statusCode}");
    if (response.statusCode == HttpStatus.notFound) return null;
    if (response.statusCode != 200) {
      throw Exception('Failed to select unit');
    }
    return UnitDto.fromJson(response.data);
  }

  Future<UnitDto?> fetchSelectedUnit() async {
    final response = await _client.get('/game/selected-unit');
    if (response.statusCode == HttpStatus.notFound) return null;
    if (response.statusCode != 200) {
      throw Exception('Failed to load unit');
    }
    return UnitDto.fromJson(response.data);
  }

  //---------------------------------------------------------------------

  Future<List<TodoDto>> fetchTodos() async {
    final response = await _client.get('/todos');
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => TodoDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<TodoDto> createTodo(CreateTodoDto todo) async {
    final response = await _client.post(
      '/todos',
      data: json.encode(todo.toJson()),
    );
    if (response.statusCode == 200) {
      return TodoDto.fromJson(response.data);
    } else {
      throw Exception('Failed to create todo');
    }
  }

  Future<TodoDto> updateTodo(UpdateTodoDto dto) async {
    debugPrint('start update');
    final response = await _client.put(
      '/todos/${dto.id}',
      data: json.encode(dto.toJson()),
    );
    if (response.statusCode != 200) {
      debugPrint('start not 200');
      throw Exception('Failed to update todo');
    }

    debugPrint('start good ${response.data}');
    return TodoDto.fromJson(response.data);
  }

  Future<bool> deleteTodo(int id) async {
    final response = await _client.delete('/todos/$id');
    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    }
    return false;
  }

  Future<TodoDto> fetchTodoById(String id) async {
    final response = await _client.get('/todos/$id');
    if (response.statusCode == 200) {
      return TodoDto.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch todo by ID');
    }
  }
}
