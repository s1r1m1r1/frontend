import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:frontend/core/network/api_exception.dart';
import 'package:frontend/core/network/with_token_api.dart';
import 'package:frontend/core/network/registration_api.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

@lazySingleton
class AuthRepository {
  final RegistrationApi _api;
  final WithTokenApi _protectedApi;
  AuthRepository(this._api, this._protectedApi);

  Future<Session> login(String email, String password) async {
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
    return session;
  }

  Future<Session> signup(String email, String password) async {
    final resp = await _api.signup(
      EmailCredentialDto(email: email, password: password),
    );
    if (resp.statusCode == 401) {
      throw const WrongLoginApiException();
    }
    final dto = resp.body;
    if (dto == null) throw const EmptyBodyApiException();
    final newSession = Session.fromDto(dto);
    return newSession;
  }

  Future<Session?> checkToken(String token) async {
    final response = await _protectedApi.getSession();
    final dto = response.body;
    if (dto != null) {
      final newSession = Session.fromDto(dto);
      return newSession;
    }
    return null;
  }

  Future<Session?> updateTokensOnRefresh(String refreshToken) async {
    final resp = await _api.refresh(RefreshTokenDto(refreshToken));
    final dto = resp.body;
    if (resp.statusCode == 401 || dto == null) {
      // _sessionRepository.onRefreshTokenExpired();
      return null;
    }

    final newSession = Session.fromDto(dto);
    return newSession;
  }

  //---------  session  ------------------------------------------------------------------------------------------
}
