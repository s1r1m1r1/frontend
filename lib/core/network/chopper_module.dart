import 'package:chopper/chopper.dart';
import 'package:frontend/core/network/authenticator.dart';
import 'package:frontend/core/network/chopper_interceptor.dart';
import 'package:frontend/core/network/json_converter.dart';
import 'package:frontend/core/network/with_token_api.dart';
import 'package:frontend/core/network/registration_api.dart';
import 'package:frontend/inject/app_config.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

@module
abstract class ChopperModule {
  // Make sure your SessionRepository is also injectable and available here.
  @Named('withToken')
  @lazySingleton
  ChopperClient chopperClient(
    TokenAuthenticator authenticator,
    AppConfig appConfig,
  ) {
    return ChopperClient(
      baseUrl: Uri.parse(appConfig.httpBaseUrl),
      services: [WithTokenApi.create()],
      authenticator: authenticator,
      interceptors: [BearerInterceptor(), LoggerInterceptor()],
      converter: JsonSerializableConverter({
        ListUnitDto: ListUnitDto.fromJsonFactory,
        UnitDto: UnitDto.fromJsonFactory,
        TodoDto: TodoDto.fromJsonFactory,
        SessionDto: SessionDto.fromJsonFactory,
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
        TokensDto: TokensDto.fromJsonFactory,
      }),
    );
  }

  // Inject the generated Chopper service
  @lazySingleton
  WithTokenApi protectedApiService(@Named('withToken') ChopperClient client) =>
      WithTokenApi.create(client);

  @lazySingleton
  RegistrationApi registrationApi(@Named('reg') ChopperClient client) =>
      RegistrationApi.create(client);
}
