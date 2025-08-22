import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:sha_red/sha_red.dart';
part 'with_token_api.chopper.dart';

// Import your DTOs here
// import 'package:sha_red/sha_red.dart'; // Adjust as needed
// import 'package:your_project/dtos/session_dto.dart';
// import 'package:your_project/dtos/unit_dto.dart';
// import 'package:your_project/dtos/todo_dto.dart';

// This is the abstract class that chopper_generator will use.
@ChopperApi(baseUrl: '')
abstract class WithTokenApi extends ChopperService {
  // A helper method to create an instance of the generated service class
  static WithTokenApi create([ChopperClient? client]) {
    // The name of the generated class is `_$<YourClassName>`
    return _$WithTokenApi(client);
  }

  //---------------------------------------------------------------------

  @GET(path: '/session')
  Future<Response<SessionDto>> getSession();

  @GET(path: '/game/unit')
  Future<Response<ListUnitDto>> fetchListUnit();

  @POST(path: '/game/unit')
  Future<Response<UnitDto>> createUnit(@Body() CreateUnitDto dto);

  @PUT(path: '/game/unit/{id}')
  Future<Response<UnitDto>> updateUnit(
    @Path('id') int id,
    @Body() UpdateUnitDto dto,
  );

  @DELETE(path: '/game/unit/{id}')
  Future<Response<void>> deleteUnit(@Path('id') int id);

  @POST(path: '/game/selected-unit/{unitId}')
  Future<Response<UnitDto>> setSelectedUnit(@Path('unitId') int unitId);

  @GET(path: '/game/selected-unit')
  Future<Response<UnitDto>> fetchSelectedUnit();

  //---------------------------------------------------------------------

  @GET(path: '/todos')
  Future<Response<List<TodoDto>>> fetchTodos();

  @POST(path: '/todos')
  Future<Response<TodoDto>> createTodo(@Body() CreateTodoDto todo);

  @PUT(path: '/todos/{id}')
  Future<Response<TodoDto>> updateTodo(
    @Path('id') int id,
    @Body() UpdateTodoDto dto,
  );

  @DELETE(path: '/todos/{id}')
  Future<Response<void>> deleteTodo(@Path('id') int id);

  @GET(path: '/todos/{id}')
  Future<Response<TodoDto>> fetchTodoById(@Path('id') String id);
}

// Don't forget to run this command in your terminal to generate the code:
// flutter pub run build_runner build --delete-conflicting-outputs
