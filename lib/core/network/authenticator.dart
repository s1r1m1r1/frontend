import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/auth/logic/session.bloc.dart';
import 'package:get_it/get_it.dart';

import '../../inject/get_it.dart';

const retryCountHeader = 'Retry-Count';

class TokenAuthenticator implements Authenticator {
  Completer<String?>? _completer;

  TokenAuthenticator();

  static final n = '$magenta TokenAuthenticator$reset';

  @override
  FutureOr<Request?> authenticate(
    Request request,
    Response<dynamic> response, [
    Request? originalRequest,
  ]) async {
    debugPrint('$n ${request.method} ${request.url}');
    if (request.body != null) {
      debugPrint('$n Body: ${request.body}');
    }
    debugPrint('$n Response: ${response.statusCode}');

    if (response.statusCode == HttpStatus.unauthorized) {
      if (request.headers[retryCountHeader] != null) {
        debugPrint('$n Unable to refresh token, retry count exceeded');
        return null;
      }

      try {
        final newAccessToken = await _refreshToken();
        debugPrint('$n New access token: $newAccessToken');
        final updatedRequest = applyHeaders(request, {
          HttpHeaders.authorizationHeader: 'Bearer ${newAccessToken!}',
          retryCountHeader: '1',
        });

        return updatedRequest;
      } catch (e) {
        debugPrint('$n Failed to refresh access token: $e');
        return null;
      }
    }

    return null;
  }

  Future<String?> _refreshToken() {
    var completer = _completer;
    if (completer != null && !completer.isCompleted) {
      debugPrint('$n Access token refresh is already in progress');
      return completer.future;
    }

    completer = Completer<String?>();
    _completer = completer;
    getIt<SessionBloc>().add(SessionEvent.updateTokensOnRefresh(completer));
    return completer.future;
  }

  @override
  AuthenticationCallback? get onAuthenticationFailed => null;

  @override
  AuthenticationCallback? get onAuthenticationSuccessful => null;
}
