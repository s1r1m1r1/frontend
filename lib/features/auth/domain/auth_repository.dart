import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/core/network/registration_api_service.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/user.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:frontend/features/unit/domain/unit.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

import '../../../app/logger/log_colors.dart';
import '../../../db/db_client.dart';

const _tokenKey = '__tokenK__';
const _refreshTokenK = '__refreshTokenK__';

@lazySingleton
class AuthRepository {
  final RegistrationApiService _api;
  final DbClient _db;
  WsCallback? wsSend;
  AuthRepository(this._api, this._db) {
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

  // final tokenNtf = ValueNotifier<String?>(null);
  // final refreshTokenNtf = ValueNotifier<String?>(null);
  final sessionNtf = ValueNotifier<Session?>(null);

  @disposeMethod
  void dispose() {
    // _sessionManager.removeListener(_onChangeSessionStatus);
  }

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

  Future<bool> login(String email, String password) async {
    try {
      debugPrint('login');
      final dto = await _api.login(
        EmailCredentialDto(email: email, password: password),
      );
      final session = Session.fromDto(dto);
      sessionNtf.value = session;
      await setTokens(dto.tokens);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signup(String email, String password) async {
    final dto = await _api.signup(
      EmailCredentialDto(email: email, password: password),
    );
    final newSession = Session.fromDto(dto);
    sessionNtf.value = newSession;
    setTokens(dto.tokens);
  }

  Future<void> checkToken() async {
    final session = sessionNtf.value;
    final token = session?.accessToken;
    if (token != null) {
      final dto = await _api.getSession(token);
      final newSession = Session.fromDto(dto);
      sessionNtf.value = newSession;
      setTokens(dto.tokens);

      return;
    }
    final refresh = session?.refreshToken;
    if (refresh != null) {}
    refreshToken();
  }

  Future<bool> refreshToken() async {
    final refresh = sessionNtf.value?.refreshToken;
    if (refresh == null) {
      debugPrint('No refresh token available');
      return false;
    }
    try {
      final dto = await _api.refresh(refresh);
      final newSession = Session.fromDto(dto);
      sessionNtf.value = newSession;
      setTokens(dto.tokens);
      return true;
    } catch (err) {
      if (err is DioException && err.response?.statusCode == 401) {
        onRefreshTokenExpired();
      }
      debugPrint('Failed to refresh access token: $err');
      return false;
    }
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

  //---------  ws  ------------------------------------------------------------------------------------------

  void wsJoin() {
    final token = sessionNtf.value?.accessToken;
    if (token != null) {
      final encoded = ToServer.withToken(token).encoded();
      wsSend?.call(encoded);
      return;
    }
    final refresh = sessionNtf.value?.refreshToken;
    if (refresh != null) {
      final encoded = ToServer.withRefresh(refresh).encoded();
      wsSend?.call(encoded);
      return;
    }
  }

  void wsLogin(String email, String password) {
    final dto = EmailCredentialDto(email: email, password: password);
    final encoded = ToServer.login(dto).encoded();
    wsSend?.call(encoded);
  }

  void wsSignup(String email, String password) {
    final dto = EmailCredentialDto(email: email, password: password);
    final encoded = ToServer.signup(dto).encoded();
    wsSend?.call(encoded);
  }

  void wsJoinedSession(
    String mainRoomId,
    UserDto user,
    UnitDto unit, {
    TokensDto? tokens,
  }) {
    final session = sessionNtf.value;
    if (session == null) return;
    sessionNtf.value = Session.gameJoined(
      user: User.fromDto(user),
      unit: Unit.fromDto(unit),
      refreshToken: tokens?.refreshToken ?? session.refreshToken,
      accessToken: tokens?.accessToken ?? session.accessToken,
      gameOption: WsGameOption(mainRoomId: mainRoomId),
    );
  }

  // @override
  // FutureOr<void> withToken() async {
  //   // debug
  //   debugPrint('$magenta withToken $reset');
  //   final token = tokenNtf.value;
  //   if (token != null) {
  //     debugPrint('$magenta withToken $token $reset');
  //     await _api.profile(token).onError((err, st) {
  //       if (err is DioException && err.response?.statusCode == 401) {
  //         debugPrint('$magenta tokenExpired  $reset');
  //         onTokenExpired();
  //         return;
  //       }
  //       debugPrint(err.toString());
  //       return;
  //     });
  //     // valid 200 status
  //     authStatusNtf.add(AuthStatus.loggedIn);
  //     return;
  //   }
  //   authStatusNtf.add(AuthStatus.loggedOut);
  // }
}
