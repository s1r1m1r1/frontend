import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:frontend/features/auth/logic/session.bloc.dart';

import '../../inject/get_it.dart';

const retryCountHeader = 'Retry-Count';

class TokenAuthenticator implements Authenticator {
  Completer<String?>? _completer;

  TokenAuthenticator();

  @override
  FutureOr<Request?> authenticate(
    Request request,
    Response<dynamic> response, [
    Request? originalRequest,
  ]) async {
    if (request.body != null) {}

    if (response.statusCode == HttpStatus.unauthorized) {
      if (request.headers[retryCountHeader] != null) {
        return null;
      }

      try {
        final newAccessToken = await _refreshToken();
        final updatedRequest = applyHeaders(request, {
          HttpHeaders.authorizationHeader: 'Bearer ${newAccessToken!}',
          retryCountHeader: '1',
        });

        return updatedRequest;
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  Future<String?> _refreshToken() {
    var completer = _completer;
    if (completer != null && !completer.isCompleted) {
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
