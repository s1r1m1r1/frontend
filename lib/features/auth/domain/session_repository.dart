import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/db/db_client.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

const _tokenKey = '__tokenK__';
const _refreshTokenK = '__refreshTokenK__';

@lazySingleton
class SessionRepository {
  final DbClient _db;
  SessionRepository(this._db) {
    init();
  }

  Future<void> init() async {
    try {
      final token = await _db.getKeyValue(_tokenKey);
      final refreshToken = await _db.getKeyValue(_refreshTokenK);
      debugPrint('$green LOADED token: $token ,refresh: $refreshToken $reset');
      if (refreshToken == null) return;
      final pendingSession = Session.pending(
        accessToken: token,
        refreshToken: refreshToken,
      );
      sessionNtf.value = pendingSession;
    } catch (e) {
      debugPrint(e.toString());
    }
    // _sessionManager.addListener(_onChangeSessionStatus);
  }

  final sessionNtf = ValueNotifier<Session?>(null);

  void onTokenExpired() {
    debugPrint('$red onTokenExpired $reset');
    unawaited(_db.deleteKeyValue(_tokenKey));
    final s = sessionNtf.value;
    if (s != null) {
      sessionNtf.value = s.copyWith(accessToken: null);
    }
  }

  void onRefreshTokenExpired() {
    unawaited(_db.deleteKeyValue(_refreshTokenK));
    sessionNtf.value = null;
  }

  Future<void> setTokens(TokensDto tokens) async {
    debugPrint(
      'Set t: ${tokens.accessToken} ,r: refresh ${tokens.refreshToken}',
    );
    await _db.saveKeyValue(_tokenKey, tokens.accessToken);
    await _db.saveKeyValue(_refreshTokenK, tokens.refreshToken);
    sessionNtf.value = sessionNtf.value?.copyWith(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    );
  }

  void logOut() {
    unawaited(_db.deleteKeyValue(_tokenKey));
    unawaited(_db.deleteKeyValue(_refreshTokenK));
    sessionNtf.value = null;
  }
}
