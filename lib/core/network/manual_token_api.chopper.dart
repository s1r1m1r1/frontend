// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_token_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ManualTokenApi extends ManualTokenApi {
  _$ManualTokenApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ManualTokenApi;

  @override
  Future<Response<FakeUserDto>> createFakeUser(
    String token,
    EmailCredentialDto dto,
  ) {
    final Uri $url = Uri.parse('/dev/fake');
    final Map<String, String> $headers = {'Authorization': token};
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<FakeUserDto, FakeUserDto>($request);
  }

  @override
  Future<Response<List<FakeUserDto>>> getListFakes(String token) {
    final Uri $url = Uri.parse('/dev/fake');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<List<FakeUserDto>, FakeUserDto>($request);
  }

  @override
  Future<Response<SessionDto>> getSession(String token) {
    final Uri $url = Uri.parse('/session');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<SessionDto, SessionDto>($request);
  }

  @override
  Future<Response<ListUnitDto>> fetchListUnit(String token) {
    final Uri $url = Uri.parse('/game/unit');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ListUnitDto, ListUnitDto>($request);
  }

  @override
  Future<Response<UnitDto>> createUnit(String token, CreateUnitDto dto) {
    final Uri $url = Uri.parse('/game/unit');
    final Map<String, String> $headers = {'Authorization': token};
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<UnitDto, UnitDto>($request);
  }

  @override
  Future<Response<UnitDto>> updateUnit(
    String token,
    int id,
    UpdateUnitDto dto,
  ) {
    final Uri $url = Uri.parse('/game/unit/${id}');
    final Map<String, String> $headers = {'Authorization': token};
    final $body = dto;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<UnitDto, UnitDto>($request);
  }

  @override
  Future<Response<void>> deleteUnit(String token, int id) {
    final Uri $url = Uri.parse('/game/unit/${id}');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<void, void>($request);
  }

  @override
  Future<Response<UnitDto>> setSelectedUnit(String token, int unitId) {
    final Uri $url = Uri.parse('/game/selected-unit/${unitId}');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<UnitDto, UnitDto>($request);
  }

  @override
  Future<Response<UnitDto>> fetchSelectedUnit(String token) {
    final Uri $url = Uri.parse('/game/selected-unit');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<UnitDto, UnitDto>($request);
  }

  @override
  Future<Response<List<TodoDto>>> fetchTodos(String token) {
    final Uri $url = Uri.parse('/todos');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<List<TodoDto>, TodoDto>($request);
  }

  @override
  Future<Response<TodoDto>> createTodo(String token, CreateTodoDto todo) {
    final Uri $url = Uri.parse('/todos');
    final Map<String, String> $headers = {'Authorization': token};
    final $body = todo;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<TodoDto, TodoDto>($request);
  }

  @override
  Future<Response<TodoDto>> updateTodo(
    String token,
    int id,
    UpdateTodoDto dto,
  ) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Map<String, String> $headers = {'Authorization': token};
    final $body = dto;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<TodoDto, TodoDto>($request);
  }

  @override
  Future<Response<void>> deleteTodo(String token, int id) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<void, void>($request);
  }

  @override
  Future<Response<TodoDto>> fetchTodoById(String token, String id) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Map<String, String> $headers = {'Authorization': token};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<TodoDto, TodoDto>($request);
  }

  @override
  Future<Response<SessionDto>> signup(EmailCredentialDto dto) {
    final Uri $url = Uri.parse('/users/signup');
    final $body = dto;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SessionDto, SessionDto>($request);
  }

  @override
  Future<Response<SessionDto>> login(EmailCredentialDto dto) {
    final Uri $url = Uri.parse('/users/login');
    final $body = dto;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SessionDto, SessionDto>($request);
  }

  @override
  Future<Response<SessionDto>> refresh(RefreshTokenDto dto) {
    final Uri $url = Uri.parse('/users/refresh');
    final $body = dto;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SessionDto, SessionDto>($request);
  }
}
