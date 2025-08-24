import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/core/network/api_exception.dart';
// import 'package:frontend/core/network/protected_api_service.dart';
import 'package:frontend/core/network/with_token_api.dart';
import 'package:frontend/core/network/registration_api.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

abstract class AuthRepository {
  Future<bool> updateTokensOnRefresh();
  FutureOr<void> logout();
  FutureOr<void> checkToken();
  Future<void> login(String email, String password);
  Future<void> signup(String email, String password);
  WsCallback? wsSend;
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final RegistrationApi _api;
  final WithTokenApi _protectedApi;
  final SessionRepository _sessionRepository;
  @override
  WsCallback? wsSend;
  AuthRepositoryImpl(this._api, this._sessionRepository, this._protectedApi);

  @override
  void logout() {
    _sessionRepository.clean();
  }

  @override
  Future<void> login(String email, String password) async {
    debugPrint('login');
    final resp = await _api.login(
      EmailCredentialDto(email: email, password: password),
    );
    if (resp.statusCode == 404 || resp.statusCode == 401) {
      throw const WrongLoginApiException();
    }
    final dto = resp.body;
    if (dto == null) throw const EmptyBodyApiException();

    final session = Session.fromDto(dto);
    _sessionRepository.setSession(session);
  }

  @override
  Future<void> signup(String email, String password) async {
    final resp = await _api.signup(
      EmailCredentialDto(email: email, password: password),
    );
    if (resp.statusCode == 401) {
      throw const WrongLoginApiException();
    }
    final dto = resp.body;
    if (dto == null) throw const EmptyBodyApiException();
    final newSession = Session.fromDto(dto);
    _sessionRepository.setSession(newSession);
  }

  @override
  Future<void> checkToken() async {
    final token = _sessionRepository.getAccessToken;
    if (token != null) {
      final response = await _protectedApi.getSession();
      final dto = response.body;
      if (dto != null) {
        final newSession = Session.fromDto(dto);
        _sessionRepository.setSession(newSession);
      }

      return;
    }
    final refresh = _sessionRepository.getRefreshToken;
    if (refresh != null) {}
    updateTokensOnRefresh();
  }

  @override
  Future<bool> updateTokensOnRefresh() async {
    final refresh = _sessionRepository.getRefreshToken;
    if (refresh == null) {
      _sessionRepository.onRefreshTokenExpired();
      return false;
    }
    try {
      final resp = await _api
          .refresh(RefreshTokenDto(refresh))
          .timeout(Duration(seconds: 5));
      final dto = resp.body;
      if (resp.statusCode == 401 || dto == null) {
        _sessionRepository.onRefreshTokenExpired();
        return false;
      }

      final newSession = Session.fromDto(dto);
      _sessionRepository.setSession(newSession);
      return true;
    } on TimeoutException {
      return false;
    } on Object catch (err) {
      // unknown error
      _sessionRepository.onRefreshTokenExpired();
      debugPrint('Failed to refresh access token: $err');
      return false;
    }
  }

  //---------  session  ------------------------------------------------------------------------------------------
}
