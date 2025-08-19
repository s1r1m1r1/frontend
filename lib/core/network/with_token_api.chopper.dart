// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'with_token_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$WithTokenApi extends WithTokenApi {
  _$WithTokenApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = WithTokenApi;

  @override
  Future<Response<SessionDto>> getSession() {
    final Uri $url = Uri.parse('/session');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<SessionDto, SessionDto>($request);
  }

  @override
  Future<Response<ListUnitDto>> fetchListUnit() {
    final Uri $url = Uri.parse('/game/unit');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<ListUnitDto, ListUnitDto>($request);
  }

  @override
  Future<Response<UnitDto>> createUnit(CreateUnitDto dto) {
    final Uri $url = Uri.parse('/game/unit');
    final $body = dto;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UnitDto, UnitDto>($request);
  }

  @override
  Future<Response<UnitDto>> updateUnit(int id, UpdateUnitDto dto) {
    final Uri $url = Uri.parse('/game/unit/${id}');
    final $body = dto;
    final Request $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<UnitDto, UnitDto>($request);
  }

  @override
  Future<Response<void>> deleteUnit(int id) {
    final Uri $url = Uri.parse('/game/unit/${id}');
    final Request $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  @override
  Future<Response<UnitDto>> setSelectedUnit(int unitId) {
    final Uri $url = Uri.parse('/game/selected-unit/${unitId}');
    final Request $request = Request('POST', $url, client.baseUrl);
    return client.send<UnitDto, UnitDto>($request);
  }

  @override
  Future<Response<UnitDto>> fetchSelectedUnit() {
    final Uri $url = Uri.parse('/game/selected-unit');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<UnitDto, UnitDto>($request);
  }

  @override
  Future<Response<List<TodoDto>>> fetchTodos() {
    final Uri $url = Uri.parse('/todos');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<List<TodoDto>, TodoDto>($request);
  }

  @override
  Future<Response<TodoDto>> createTodo(CreateTodoDto todo) {
    final Uri $url = Uri.parse('/todos');
    final $body = todo;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TodoDto, TodoDto>($request);
  }

  @override
  Future<Response<TodoDto>> updateTodo(int id, UpdateTodoDto dto) {
    final Uri $url = Uri.parse('/todos/${id}');
    final $body = dto;
    final Request $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<TodoDto, TodoDto>($request);
  }

  @override
  Future<Response<void>> deleteTodo(int id) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Request $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  @override
  Future<Response<TodoDto>> fetchTodoById(String id) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<TodoDto, TodoDto>($request);
  }
}
