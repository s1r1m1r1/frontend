import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/auth/domain/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BearerInterceptor implements Interceptor {
  final TokenRepository _repository;

  const BearerInterceptor(this._repository);

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final token = _repository.accessNtf.value;

    final request = applyHeader(
      chain.request,
      HttpHeaders.authorizationHeader,
      'Bearer $token',
    );
    final response = await chain.proceed(request);
    return response;
  }
}

class LoggerInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    debugPrint(
      '${green}LoggerInterceptor$reset: ${chain.request.method} ${chain.request.url}\n'
      '$body:${chain.request.body}',
    );
    final response = await chain.proceed(chain.request);
    debugPrint(
      '${green}LoggerInterceptor$reset: ${response.statusCode},'
      'body:\n${response.body}',
    );
    return response;
  }
}
