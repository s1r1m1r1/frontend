import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/core/network/protected_api_service.dart';
import 'package:frontend/core/network/registration_api_service.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:frontend/features/auth/domain/user.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:frontend/features/unit/domain/unit.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

import '../../../db/db_client.dart';

@lazySingleton
class AuthRepository {
  final RegistrationApiService _api;
  final ProtectedApiService _protectedApi;
  final SessionRepository _sessionRepository;
  WsCallback? wsSend;
  AuthRepository(this._api, this._sessionRepository, this._protectedApi);

  ValueNotifier<Session?> get sessionNtf => _sessionRepository.sessionNtf;

  // final tokenNtf = ValueNotifier<String?>(null);
  // final refreshTokenNtf = ValueNotifier<String?>(null);
  @disposeMethod
  void dispose() {
    // _sessionManager.removeListener(_onChangeSessionStatus);
  }

  Future<bool> login(String email, String password) async {
    try {
      debugPrint('login');
      final dto = await _api.login(
        EmailCredentialDto(email: email, password: password),
      );
      final session = Session.fromDto(dto);
      sessionNtf.value = session;
      await _sessionRepository.setTokens(dto.tokens);
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
    await _sessionRepository.setTokens(dto.tokens);
  }

  Future<void> checkToken() async {
    final session = sessionNtf.value;
    final token = session?.accessToken;
    if (token != null) {
      final dto = await _protectedApi.getSession();
      final newSession = Session.fromDto(dto);
      sessionNtf.value = newSession;
      await _sessionRepository.setTokens(dto.tokens);

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
      await _sessionRepository.setTokens(dto.tokens);
      return true;
    } catch (err) {
      if (err is DioException && err.response?.statusCode == 401) {
        _sessionRepository.onRefreshTokenExpired();
      }
      debugPrint('Failed to refresh access token: $err');
      return false;
    }
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
