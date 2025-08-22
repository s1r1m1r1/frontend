import 'package:chopper/chopper.dart';
import 'package:frontend/core/network/chopper_interceptor.dart';
import 'package:frontend/core/network/json_converter.dart';
import 'package:frontend/core/network/manual_token_api.dart';
import 'package:frontend/core/network/with_token_api.dart';
import 'package:frontend/core/network/registration_api.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:frontend/inject/app_config.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

@module
abstract class ChopperModule {
  // Make sure your SessionRepository is also injectable and available here.
  @Named('withToken')
  @lazySingleton
  ChopperClient chopperClient(
    SessionRepository repository,
    AppConfig appConfig,
  ) {
    return ChopperClient(
      baseUrl: Uri.parse(appConfig.httpBaseUrl),
      services: [WithTokenApi.create()],
      interceptors: [BearerInterceptor(repository), LoggerInterceptor()],
      converter: JsonSerializableConverter({
        ListUnitDto: ListUnitDto.fromJsonFactory,
        UnitDto: UnitDto.fromJsonFactory,
        TodoDto: TodoDto.fromJsonFactory,
        SessionDto: SessionDto.fromJsonFactory,
      }),
    );
  }

  @Named('manualToken')
  @lazySingleton
  ChopperClient manualClient(AppConfig appConfig) {
    return ChopperClient(
      baseUrl: Uri.parse(appConfig.httpBaseUrl),
      services: [ManualTokenApi.create()],
      interceptors: [LoggerInterceptor()],
      converter: JsonSerializableConverter({
        ListUnitDto: ListUnitDto.fromJsonFactory,
        UnitDto: UnitDto.fromJsonFactory,
        TodoDto: TodoDto.fromJsonFactory,
        SessionDto: SessionDto.fromJsonFactory,
        FakeUserDto: FakeUserDto.fromJsonFactory,
      }),
    );
  }

  @Named('reg')
  @lazySingleton
  ChopperClient regClient(AppConfig appConfig) {
    return ChopperClient(
      baseUrl: Uri.parse(appConfig.httpBaseUrl),

      services: [RegistrationApi.create()],
      interceptors: [LoggerInterceptor()],
      converter: JsonSerializableConverter({
        SessionDto: SessionDto.fromJsonFactory,
      }),
    );
  }

  // Inject the generated Chopper service
  @lazySingleton
  WithTokenApi protectedApiService(@Named('withToken') ChopperClient client) =>
      WithTokenApi.create(client);

  @lazySingleton
  ManualTokenApi manualApiService(@Named('manualToken') ChopperClient client) =>
      ManualTokenApi.create(client);

  @lazySingleton
  RegistrationApi registrationApi(@Named('reg') ChopperClient client) =>
      RegistrationApi.create(client);
}
