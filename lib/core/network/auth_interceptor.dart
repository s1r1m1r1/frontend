import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';

import '../../app/logger/log_colors.dart';
import '../../features/auth/domain/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  final SessionRepository _repository;
  final Dio retryDio;

  AuthInterceptor(this._repository, this.retryDio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = _repository
        .sessionNtf
        .value
        ?.accessToken; // Retrieve token from secure storage
    if (token != null) {
      debugPrint('$green with Bearer $token $reset');
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      debugPrint(
        '$red No token found, proceeding without Authorization header$reset',
      );
      _repository.onTokenExpired();
      return;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'Response body: ${response.data} status code: ${response.statusCode}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle token refresh logic here if needed (e.g., 401 Unauthorized)
    if (err.response?.statusCode == 401) {
      debugPrint('$red Unauthorized. Attempting to refresh token... $reset');
      _repository.onTokenExpired();
      // Potentially attempt to refresh token and retry the request
    }
    super.onError(err, handler);
  }
}

class RegistrationInterceptor extends Interceptor {
  RegistrationInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint('Request headers: ${options.headers}');

    debugPrint('Request URL: ${options.uri} body: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response  body: ${response.data} ${response.statusCode}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle token refresh logic here if needed (e.g., 401 Unauthorized)
    if (err.response?.statusCode == 401) {
      debugPrint('Unauthorized. Attempting to refresh token...');
      // Potentially attempt to refresh token and retry the request
    }
    super.onError(err, handler);
  }
}
