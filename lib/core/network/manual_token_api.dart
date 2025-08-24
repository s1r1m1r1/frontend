import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:sha_red/sha_red.dart';
part 'manual_token_api.chopper.dart';

// This is the abstract class that chopper_generator will use.
@ChopperApi(baseUrl: '')
abstract class ManualTokenApi extends ChopperService {
  // A helper method to create an instance of the generated service class
  static ManualTokenApi create([ChopperClient? client]) {
    // The name of the generated class is `_$<YourClassName>`
    return _$ManualTokenApi(client);
  }

  //---------------------------------------------------------------------
  //------------ create fake use   --------------------------------------
  @POST(path: '/dev/fake')
  Future<Response<FakeUserDto>> createFakeUser(
    @Header("Authorization") String token,
    @Body() EmailCredentialDto dto,
  );

  @GET(path: '/dev/fake')
  Future<Response<List<FakeUserDto>>> getListFakes(
    @Header("Authorization") String token,
  );
  //---------------------------------------------------------------------

  @GET(path: '/session')
  Future<Response<SessionDto>> getSession(
    @Header("Authorization") String token,
  );

  @GET(path: '/game/unit')
  Future<Response<ListUnitDto>> fetchListUnit(
    @Header("Authorization") String token,
  );

  @POST(path: '/game/unit')
  Future<Response<UnitDto>> createUnit(
    @Header("Authorization") String token,
    @Body() CreateUnitDto dto,
  );

  @PUT(path: '/game/unit/{id}')
  Future<Response<UnitDto>> updateUnit(
    @Header("Authorization") String token,
    @Path('id') int id,
    @Body() UpdateUnitDto dto,
  );

  @DELETE(path: '/game/unit/{id}')
  Future<Response<void>> deleteUnit(
    @Header("Authorization") String token,
    @Path('id') int id,
  );

  @POST(path: '/game/selected-unit/{unitId}')
  Future<Response<UnitDto>> setSelectedUnit(
    @Header("Authorization") String token,
    @Path('unitId') int unitId,
  );

  @GET(path: '/game/selected-unit')
  Future<Response<UnitDto>> fetchSelectedUnit(
    @Header("Authorization") String token,
  );

  //---------------------------------------------------------------------

  @GET(path: '/todos')
  Future<Response<List<TodoDto>>> fetchTodos(
    @Header("Authorization") String token,
  );

  @POST(path: '/todos')
  Future<Response<TodoDto>> createTodo(
    @Header("Authorization") String token,
    @Body() CreateTodoDto todo,
  );

  @PUT(path: '/todos/{id}')
  Future<Response<TodoDto>> updateTodo(
    @Header("Authorization") String token,
    @Path('id') int id,
    @Body() UpdateTodoDto dto,
  );

  @DELETE(path: '/todos/{id}')
  Future<Response<void>> deleteTodo(
    @Header("Authorization") String token,
    @Path('id') int id,
  );

  @GET(path: '/todos/{id}')
  Future<Response<TodoDto>> fetchTodoById(
    @Header("Authorization") String token,
    @Path('id') String id,
  );

  @POST(path: '/users/signup')
  Future<Response<SessionDto>> signup(@Body() EmailCredentialDto dto);

  @POST(path: '/users/login')
  Future<Response<SessionDto>> login(@Body() EmailCredentialDto dto);

  @POST(path: '/users/refresh')
  // For the refresh token, we can pass the DTO directly in the body
  // and set the content type using a header if needed, but Chopper
  // handles JSON encoding by default with the JsonConverter.
  Future<Response<SessionDto>> refresh(@Body() RefreshTokenDto dto);

  // Don't forget to run this command in your terminal to generate the code:
  // flutter pub run build_runner build --delete-conflicting-outputs
}
