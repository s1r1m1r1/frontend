import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/core/network/api_exception.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:frontend/inject/get_it.dart';

// Import your logger colors if needed
// import '../../app/logger/log_colors.dart';

class BearerInterceptor implements Interceptor {
  final SessionRepository _repository;

  BearerInterceptor(this._repository);

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final token = _repository.sessionNtf.value?.accessToken;
    if (token == null) {
      _retryAfterRefreshToken(chain);
    }
    final request = applyHeader(
      chain.request,
      'Authorization',
      'Bearer $token',
    );
    final response = await chain.proceed(request);
    if (response.statusCode == 401) {
      _retryAfterRefreshToken(chain);
    }
    return response;
  }

  FutureOr<Response<T>> _retryAfterRefreshToken<T>(Chain<T> chain) async {
    final refresh = _repository.sessionNtf.value?.refreshToken;
    if (refresh == null) {
      throw DinedTokenApiException();
    }
    final isUpdated = await getIt<AuthRepository>().refreshToken();
    if (isUpdated) {
      final response = await chain.proceed(chain.request);
      return response;
    }
    throw DinedTokenApiException();
  }
}

class LoggerInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    debugPrint(
      '${green}LoggerInterceptor$reset: ${chain.request.method} ${chain.request.url}\n'
      '$body:{chain.request.body}',
    );
    final response = await chain.proceed(chain.request);
    debugPrint(
      '${green}LoggerInterceptor$reset: ${response.statusCode},'
      'body:\n${response.body}',
    );
    return response;
  }
}
