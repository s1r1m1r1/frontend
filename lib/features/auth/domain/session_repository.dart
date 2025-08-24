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

abstract class SessionRepository {
  WsCallback? wsSend;
  Future<void> init();
  void wsJoin();
  void wsJoinedSession(
    int mainRoomId,
    UserDto user,
    UnitDto unit, {
    TokensDto? tokens,
  });
  void wsSessionFinished();
  String? get getAccessToken;
  String? get getRefreshToken;
  Stream<Session?> get sessionStream;
  Session? get session;
  Future<void> updateTokens(TokensDto tokens);
  FutureOr<void> clean();
  void setSession(Session session);
  void onTokenExpired();
  void onRefreshTokenExpired();
}

@LazySingleton(as: SessionRepository)
class SessionRepositoryImpl implements SessionRepository {
  final DbClient _db;
  SessionRepositoryImpl(this._db) {
    init();
  }
  @override
  WsCallback? wsSend;

  @override
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
      debugPrint('ON INIT ${_sessionSbj.value}');
    } catch (e) {
      debugPrint(e.toString());
    }
    // _sessionManager.addListener(_onChangeSessionStatus);
  }

  late final _sessionSbj = BehaviorSubject<Session?>.seeded(null);

  @override
  String? get getAccessToken => _sessionSbj.value?.accessToken;
  @override
  String? get getRefreshToken => _sessionSbj.value?.refreshToken;
  @override
  Stream<Session?> get sessionStream => _sessionSbj.stream;
  @override
  Session? get session => _sessionSbj.value;

  @override
  void onTokenExpired() {
    debugPrint('$red onTokenExpired $reset');
    unawaited(_db.deleteKeyValue(_tokenKey));
    final s = _sessionSbj.value;
    if (s != null) {
      _sessionSbj.value = s.copyWith(accessToken: null);
    }
  }

  @override
  void onRefreshTokenExpired() {
    debugPrint('$red onRefreshTokenExpired $reset');
    unawaited(_db.deleteKeyValue(_refreshTokenK));
    _sessionSbj.value = null;
  }

  @override
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

  @override
  void clean() {
    unawaited(_db.deleteKeyValue(_tokenKey));
    unawaited(_db.deleteKeyValue(_refreshTokenK));
    _sessionSbj.value = null;
  }

  @override
  void wsJoin() {
    final token = _sessionSbj.value?.accessToken;
    if (token != null) {
      final encoded = ToServer.withToken(token).encoded();
      wsSend?.call(encoded);
      return;
    }
    final refresh = _sessionSbj.value?.refreshToken;
    if (refresh == null) {
      onRefreshTokenExpired();
      return;
    }
  }

  @override
  void wsJoinedSession(
    int mainRoomId,
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

  @override
  void wsSessionFinished() {
    final session = _sessionSbj.value;
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

  @override
  void setSession(Session session) async {
    _sessionSbj.value = session;
    unawaited(_db.saveKeyValue(_refreshTokenK, session.refreshToken));
    if (session.accessToken != null) {
      unawaited(_db.saveKeyValue(_tokenKey, session.accessToken!));
    }
  }
}
