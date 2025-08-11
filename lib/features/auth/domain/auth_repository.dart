import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/core/network/registration_api_service.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

import '../../../app/logger/log_colors.dart';
import '../../../db/db_client.dart';
import 'auth_status.dart';

const _tokenKey = '__tokenK__';
const _refreshTokenK = '__refreshTokenK__';

abstract class AuthRepository {
  Future<void> init();
  void dispose();

  AuthStatus get authStatus;
  Stream<AuthStatus> get authStatusStream;
  Stream<String?> get accessTokenStream;
  Stream<String?> get refreshTokenStream;

  String? getToken();
  String? getRefreshToken();

  void onTokenExpired();
  void onRefreshTokenExpired();
  void logOut();

  Future<bool> login(String email, String password);
  Future<void> signup(String email, String password);

  Future<bool> refreshToken();

  Future<void> setTokens(TokensDto payload);

  FutureOr<void> withToken();

  void wsWithToken();
  void wsLogin(String email, String password);
  void wsSignup(String email, String password);
  void wsWithRefresh();

  WsCallback? wsSend;
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final RegistrationApiService _api;
  final DbClient _db;
  AuthRepositoryImpl(this._api, this._db) {
    init();
  }

  @override
  Future<void> init() async {
    try {
      final token = await _db.getKeyValue(_tokenKey);
      final refreshToken = await _db.getKeyValue(_refreshTokenK);
      debugPrint('$green LOADED token: $token ,refresh: $refreshToken $reset');
      _tokenSubj.add(token);
      _refreshTokenSubj.add(refreshToken);
      _authStatusSbj.add(token != null ? AuthStatus.pending : AuthStatus.loggedOut);
    } catch (e) {
      debugPrint(e.toString());
    }
    // _sessionManager.addListener(_onChangeSessionStatus);
  }

  final _tokenSubj = BehaviorSubject<String?>.seeded(null);
  final _refreshTokenSubj = BehaviorSubject<String?>.seeded(null);

  @override
  Stream<AuthStatus> get authStatusStream => _authStatusSbj.stream;

  final _authStatusSbj = BehaviorSubject<AuthStatus>.seeded(AuthStatus.loggedOut);

  @override
  @disposeMethod
  void dispose() {
    // _sessionManager.removeListener(_onChangeSessionStatus);
  }

  @override
  AuthStatus get authStatus => _authStatusSbj.value;

  @override
  String? getToken() => _tokenSubj.value;

  @override
  String? getRefreshToken() => _refreshTokenSubj.value;

  @override
  void onTokenExpired() {
    debugPrint('$red onTokenExpired $reset');
    unawaited(_db.deleteKeyValue(_tokenKey));
    _tokenSubj.add(null);
    _authStatusSbj.add(AuthStatus.pending);
  }

  @override
  void onRefreshTokenExpired() {
    unawaited(_db.deleteKeyValue(_refreshTokenK));
    _tokenSubj.add(null);
    _authStatusSbj.add(AuthStatus.loggedOut);
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
      debugPrint('login');
      final response = await _api.login(EmailCredentialDto(email: email, password: password));
      setTokens(response);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> signup(String email, String password) async {
    final tokens = await _api.signup(EmailCredentialDto(email: email, password: password));
    setTokens(tokens);
  }

  @override
  Future<bool> refreshToken() async {
    final refresh = _refreshTokenSubj.value;
    if (refresh == null) {
      debugPrint('No refresh token available');
      return false;
    }
    try {
      final tokens = await _api.refresh(refresh);
      setTokens(tokens);
      return true;
    } catch (err) {
      if (err is DioException && err.response?.statusCode == 401) {
        onRefreshTokenExpired();
      }
      debugPrint('Failed to refresh access token: $err');
      return false;
    }
  }

  @override
  Future<void> setTokens(TokensDto tokens) async {
    debugPrint('Set t: ${tokens.accessToken.value} ,r: refresh ${tokens.refreshToken.value}');
    await _db.saveKeyValue(_tokenKey, tokens.accessToken.value);
    await _db.saveKeyValue(_refreshTokenK, tokens.refreshToken.value);
    final t = await _db.getKeyValue(_tokenKey);
    final r = await _db.getKeyValue(_refreshTokenK);
    debugPrint('$red Success saved t: $t , r: $r $reset');
    _refreshTokenSubj.add(tokens.refreshToken.value);
    _tokenSubj.add(tokens.accessToken.value);
    _authStatusSbj.add(AuthStatus.loggedIn);
  }

  @override
  void logOut() {
    unawaited(_db.deleteKeyValue(_tokenKey));
    unawaited(_db.deleteKeyValue(_refreshTokenK));
    _tokenSubj.add(null);
    _refreshTokenSubj.add(null);
    _authStatusSbj.add(AuthStatus.loggedOut);
  }

  //---------  ws  ------------------------------------------------------------------------------------------
  @override
  void wsWithToken() {
    final token = _tokenSubj.value;
    print('WS with TOKEN: $token');
    if (token == null) {
      return;
    }

    print('WS with TOKEN: next $token');
    final dto = AccessTokenDto(token);
    final body = WsToServer(eventType: WsEventToServer.withToken, payload: dto);
    final encoded = jsonEncode(body.toJson(AccessTokenDto.toJsonF));

    print('WS with TOKEN: $encoded');
    wsSend?.call(encoded);
  }

  @override
  void wsLogin(String email, String password) {
    final dto = EmailCredentialDto(email: email, password: password);
    final body = WsToServer(eventType: WsEventToServer.login, payload: dto);
    final encoded = jsonEncode(body.toJson(EmailCredentialDto.toJsonF));
    wsSend?.call(encoded);
  }

  @override
  void wsWithRefresh() {
    final refresh = _refreshTokenSubj.value;
    if (refresh == null) {
      return;
    }
    final dto = RefreshTokenDto(refresh);
    final body = WsToServer(eventType: WsEventToServer.withRefresh, payload: dto);
    final encoded = jsonEncode(body.toJson(RefreshTokenDto.toJsonF));
    wsSend?.call(encoded);
  }

  @override
  void wsSignup(String email, String password) {
    final dto = EmailCredentialDto(email: email, password: password);
    final body = WsToServer(eventType: WsEventToServer.signup, payload: dto);
    final encoded = jsonEncode(body.toJson(EmailCredentialDto.toJsonF));
    wsSend?.call(encoded);
  }

  @override
  Stream<String?> get accessTokenStream => _tokenSubj.stream;

  @override
  Stream<String?> get refreshTokenStream => _refreshTokenSubj.stream;

  @override
  FutureOr<void> withToken() async {
    // debug
    final token = _tokenSubj.value;
    if (token != null) {
      debugPrint('$magenta withToken $token $reset');
      await _api.profile(token).onError((err, st) {
        if (err is DioException && err.response?.statusCode == 401) {
          debugPrint('$magenta tokenExpired  $reset');
          onTokenExpired();
          return;
        }
        debugPrint(err.toString());
        return;
      });
      // valid 200 status
      _authStatusSbj.add(AuthStatus.loggedIn);
    }
  }
}
