import 'package:dio/dio.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:frontend/inject/app_config.dart';
import 'package:injectable/injectable.dart';

import 'auth_interceptor.dart';

@module
abstract class DioModule {
  @Named('withToken')
  @lazySingleton
  Dio dio(
    SessionRepository _rep,
    AppConfig appConfig,
    @Named('retryDio') Dio retryDio,
  ) {
    final dio = Dio(BaseOptions(baseUrl: appConfig.httpBaseUrl));
    dio.interceptors.add(AuthInterceptor(_rep, retryDio));
    return dio;
  }

  @lazySingleton
  @Named('registration')
  Dio registrationDio(AppConfig appConfig) {
    final dio = Dio(BaseOptions(baseUrl: appConfig.httpBaseUrl));
    dio.interceptors.add(RegistrationInterceptor());
    return dio;
  }

  @lazySingleton
  @Named('retryDio')
  Dio retryDio(AppConfig appConfig) {
    final dio = Dio(BaseOptions(baseUrl: appConfig.httpBaseUrl));
    // dio.interceptors.add(RetryInterceptor());
    return dio;
  }
}
