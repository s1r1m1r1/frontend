import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/inject/get_it.dart';

import '../../features/auth/logic/session.bloc.dart';

// Import your logger colors if needed
// import '../../app/logger/log_colors.dart';

class BearerInterceptor implements Interceptor {
  SessionBloc? _blocInstance;
  SessionBloc get _bloc => _blocInstance ??= getIt<SessionBloc>();

  BearerInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final token = _bloc.state.session?.accessToken;

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
