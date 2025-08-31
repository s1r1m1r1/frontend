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
  Future<({String access, String refresh})> login(
    String email,
    String password,
  ) async {
    debugPrint('login');
    final resp = await _api.login(
      EmailCredentialDto(email: email, password: password),
    );
    if (resp.statusCode == 404 || resp.statusCode == 401) {
      throw const WrongLoginApiException();
    }
    final dto = resp.body;
    if (dto == null) throw const EmptyBodyApiException();
    return (access: dto.accessToken, refresh: dto.refreshToken);
  }

  Future<({String access, String refresh})> signup(
    String email,
    String password,
  ) async {
    final resp = await _api.signup(
      EmailCredentialDto(email: email, password: password),
    );
    if (resp.statusCode == 401) {
      throw const WrongLoginApiException();
    }
    final dto = resp.body;
    if (dto == null) throw const EmptyBodyApiException();
    return (access: dto.accessToken, refresh: dto.refreshToken);
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

  Future<({String token, String refresh})?> fetchRefreshToken(
    String refreshToken,
  ) async {
    final resp = await _api.refresh(RefreshTokenDto(refreshToken));
    final dto = resp.body;
    if (resp.statusCode == 401 || dto == null) {
      // _sessionRepository.onRefreshTokenExpired();
      return null;
    }

    return (token: dto.accessToken, refresh: dto.refreshToken);
  }

  //---------  session  ------------------------------------------------------------------------------------------
}
