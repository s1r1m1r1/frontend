import 'dart:async';

import 'package:flutter/foundation.dart';
// import 'package:frontend/core/network/protected_api_service.dart';
import 'package:frontend/core/network/with_token_api.dart';
import 'package:frontend/core/network/registration_api.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

@lazySingleton
class AuthRepository {
  final RegistrationApi _api;
  final WithTokenApi _protectedApi;
  final SessionRepository _sessionRepository;
  WsCallback? wsSend;
  AuthRepository(this._api, this._sessionRepository, this._protectedApi);

  ValueNotifier<Session?> get sessionNtf => _sessionRepository.sessionNtf;

  void logOut() {
    _sessionRepository.clean();
  }

  Future<bool> login(String email, String password) async {
    try {
      debugPrint('login');
      final resp = await _api.login(
        EmailCredentialDto(email: email, password: password),
      );
      final dto = resp.body;
      if (dto == null) return false;
      final session = Session.fromDto(dto);
      _sessionRepository.setSession(session);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signup(String email, String password) async {
    final resp = await _api.signup(
      EmailCredentialDto(email: email, password: password),
    );
    final dto = resp.body;
    if (dto == null) return;
    final newSession = Session.fromDto(dto);
    _sessionRepository.setSession(newSession);
  }

  Future<void> checkToken() async {
    final session = sessionNtf.value;
    final token = session?.accessToken;
    if (token != null) {
      final response = await _protectedApi.getSession();
      final dto = response.body;
      if (dto != null) {
        final newSession = Session.fromDto(dto);
        _sessionRepository.setSession(newSession);
      }

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
      final resp = await _api.refresh(RefreshTokenDto(refresh));
      final dto = resp.body;
      if (dto == null) return false;
      final newSession = Session.fromDto(dto);
      _sessionRepository.setSession(newSession);
      return true;
    } catch (err) {
      debugPrint('Failed to refresh access token: $err');
      return false;
    }
  }

  //---------  ws  ------------------------------------------------------------------------------------------

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
