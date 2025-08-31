import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:frontend/core/db/db_client.dart';
import 'package:frontend/core/network/registration_api.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

const _tokenKey = '__accessTokenK__';
const _refreshTokenK = '__refreshTokenK__';

@lazySingleton
class TokenRepository {
  final DbClient _db;
  final RegistrationApi _api;
  TokenRepository(this._db, this._api);
  Future<void> putAccessToken(String value) =>
      _db.saveKeyValue(_tokenKey, value);
  Future<String?> readAccessToken() => _db.getKeyValue(_tokenKey);
  Future<void> deleteAccessToken() => _db.deleteKeyValue(_tokenKey);

  Future<void> putRefreshToken(String value) =>
      _db.saveKeyValue(_refreshTokenK, value);
  Future<String?> readRefreshToken() => _db.getKeyValue(_refreshTokenK);
  Future<void> deleteRefreshToken() => _db.deleteKeyValue(_refreshTokenK);
  late final accessNtf = ValueNotifier<String?>(null);
  late final refreshNtf = ValueNotifier<String?>(null);

  Future<({String token, String refresh})?> fetchRefresh([
    String? refreshToken,
  ]) async {
    final refresh = refreshToken ?? accessNtf.value ?? await readRefreshToken();
    if (refresh == null) return null;
    final resp = await _api.refresh(RefreshTokenDto(refresh));
    final dto = resp.body;
    if (resp.statusCode == 401 || dto == null) {
      // _sessionRepository.onRefreshTokenExpired();
      return null;
    }
    return (token: dto.accessToken, refresh: dto.refreshToken);
  }

  Future<({String token, String refresh})?> fetchAndUpdateRefresh([
    String? refreshToken,
  ]) async {
    final tokens = await fetchRefresh(refreshToken);
    if (tokens == null) return null;
    await putAccessToken(tokens.token);
    await putRefreshToken(tokens.refresh);
    accessNtf.value = tokens.token;
    refreshNtf.value = tokens.refresh;
    return tokens;
  }

  void dispose() {
    accessNtf.dispose();
    refreshNtf.dispose();
  }
}
