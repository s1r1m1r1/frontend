import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:frontend/features/auth/domain/token_repository.dart';
import 'package:injectable/injectable.dart';

const retryCountHeader = 'Retry-Count';

@injectable
class TokenAuthenticator implements Authenticator {
  final TokenRepository _tokenRepository;
  const TokenAuthenticator(this._tokenRepository);

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

  Future<String?> _refreshToken() async {
    final tokens = await _tokenRepository.fetchAndUpdateRefresh();
    return tokens?.token;
  }

  @override
  AuthenticationCallback? get onAuthenticationFailed => null;

  @override
  AuthenticationCallback? get onAuthenticationSuccessful => null;
}
