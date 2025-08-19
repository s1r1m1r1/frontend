import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
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
    final request = applyHeader(
      chain.request,
      'Authorization',
      'Bearer $token',
    );
    final response = await chain.proceed(request);
    if (response.statusCode == 401) {
      debugPrint('$red BearerInterceptor $reset ${response.statusCode}');
      debugPrint('${response.base.request?.url}');
      _repository.onTokenExpired();
      final isUpdated = await getIt<AuthRepository>().refreshToken();
      if (isUpdated) {
        final response = await chain.proceed(request);
        return response;
      }
    }
    return response;
  }
}

class RegInterceptor implements Interceptor {
  RegInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    debugPrint('${yellow}RegInterceptor${reset}: ${chain.request.url}');
    try {
      final response = await chain.proceed(chain.request);
      debugPrint(
        '${yellow}RegInterceptor${reset}: type: ${response.body.runtimeType}',
      );
      debugPrint(
        '${yellow}RegInterceptor${reset}: ${response.statusCode},\n${response.body}',
      );
      return response;
    } catch (err, stack) {
      debugPrintStack(
        label: '${red} RegInterceptor${reset}: $err',
        stackTrace: stack,
      );
      rethrow;
    }
  }
}
