import 'package:dio/dio.dart';
import 'package:frontend/inject/app_config.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/domain/auth_repository.dart';
import 'auth_interceptor.dart';

@module
abstract class DioModule {
  @Named('withToken')
  @lazySingleton
  Dio dio(AuthRepository authRepository, AppConfig appConfig, @Named('retryDio') Dio retryDio) {
    final dio = Dio(BaseOptions(baseUrl: appConfig.httpBaseUrl));
    dio.interceptors.add(AuthInterceptor(authRepository, retryDio));
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
