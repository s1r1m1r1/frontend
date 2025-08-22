import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/core/db/db_client.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:sha_red/sha_red.dart';

import '../../unit/domain/unit.dart';
import 'user.dart';
import 'ws_game_option.dart';

const _tokenKey = '__tokenK__';
const _refreshTokenK = '__refreshTokenK__';

// abstract class SessionRepository {
//   WsCallback? wsSend;
//   abstract BehaviourSubject<Session?> sessionSbj;
// }

@lazySingleton
class SessionRepository {
  final DbClient _db;
  SessionRepository(this._db) {
    init();
  }
  WsCallback? wsSend;

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
      _sessionSbj.value = pendingSession;
    } catch (e) {
      debugPrint(e.toString());
    }
    // _sessionManager.addListener(_onChangeSessionStatus);
  }

  final _sessionSbj = BehaviorSubject<Session?>.seeded(null);
  String? get accessToken => _sessionSbj.value?.accessToken;
  String? get refreshToken => _sessionSbj.value?.accessToken;
  Stream<Session?> get sessionStream => _sessionSbj.stream;
  Session? get session => _sessionSbj.value;

  void onTokenExpired() {
    debugPrint('$red onTokenExpired $reset');
    unawaited(_db.deleteKeyValue(_tokenKey));
    final s = _sessionSbj.value;
    if (s != null) {
      _sessionSbj.value = s.copyWith(accessToken: null);
    }
  }

  void onRefreshTokenExpired() {
    unawaited(_db.deleteKeyValue(_refreshTokenK));
    _sessionSbj.value = null;
  }

  Future<void> updateTokens(TokensDto tokens) async {
    debugPrint(
      'Set t: ${tokens.accessToken} ,r: refresh ${tokens.refreshToken}',
    );
    await _db.saveKeyValue(_tokenKey, tokens.accessToken);
    await _db.saveKeyValue(_refreshTokenK, tokens.refreshToken);
    _sessionSbj.value = _sessionSbj.value?.copyWith(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    );
  }

  void clean() {
    unawaited(_db.deleteKeyValue(_tokenKey));
    unawaited(_db.deleteKeyValue(_refreshTokenK));
    _sessionSbj.value = null;
  }

  void wsJoin() {
    final token = _sessionSbj.value?.accessToken;
    if (token != null) {
      final encoded = ToServer.withToken(token).encoded();
      wsSend?.call(encoded);
      return;
    }
    final refresh = _sessionSbj.value?.refreshToken;
    if (refresh != null) {
      final encoded = ToServer.withRefresh(refresh).encoded();
      wsSend?.call(encoded);
      return;
    }
  }

  void wsJoinedSession(
    String mainRoomId,
    UserDto user,
    UnitDto unit, {
    TokensDto? tokens,
  }) {
    final session = _sessionSbj.value;
    if (session == null) return;
    _sessionSbj.value = Session.gameJoined(
      user: User.fromDto(user),
      unit: Unit.fromDto(unit),
      refreshToken: tokens?.refreshToken ?? session.refreshToken,
      accessToken: tokens?.accessToken ?? session.accessToken,
      gameOption: WsGameOption(mainRoomId: mainRoomId),
    );
  }

  void wsSessionFinished() {
    final session = _sessionSbj.value;
    debugPrint('$magenta wsSessionFinished $reset');
    debugPrint('$session');
    if (session is GameJoinedSession) {
      final newSession = Session.gameFinished(
        user: session.user,
        unit: session.unit,
        refreshToken: session.refreshToken,
        gameOption: session.gameOption,
      );
      _sessionSbj.value = newSession;

      debugPrint('$magenta updated $reset');
      debugPrint('${_sessionSbj.value}');
    }
  }

  void setSession(Session session) async {
    _sessionSbj.value = session;
    unawaited(_db.saveKeyValue(_refreshTokenK, session.refreshToken));
    if (session.accessToken != null) {
      unawaited(_db.saveKeyValue(_tokenKey, session.accessToken!));
    }
  }
}
