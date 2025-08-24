import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:frontend/inject/get_it.dart';

const retryCountHeader = 'Retry-Count';

class TokenAuthenticator implements Authenticator {
  final SessionRepository _repository;
  Completer<String?>? _completer;

  TokenAuthenticator(this._repository);
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
    getIt<AuthRepository>()
        .updateTokensOnRefresh()
        .then((success) {
          if (success) {
            completer?.complete(_repository.getAccessToken);
          } else {
            completer?.completeError(
              'Failed to refresh token',
              StackTrace.current,
            );
          }
        })
        .onError((error, stackTrace) {
          completer?.completeError(error ?? 'Refresh token error', stackTrace);
        });

    return completer.future;
  }

  @override
  AuthenticationCallback? get onAuthenticationFailed => null;

  @override
  AuthenticationCallback? get onAuthenticationSuccessful => null;
}
