import 'package:flutter/cupertino.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/core/network/manual_token_api.dart';
import 'package:frontend/features/admin/domain/fake_user.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:sha_red/sha_red.dart';

import '../../../core/network/ws_manager.dart';

@lazySingleton
class AdminRepository {
  WsCallback? send;
  final ManualTokenApi _api;
  AdminRepository(this._api);
  void joinRoom() {
    // send?.call(jsonEncode(WsToServer(eventType: WsEventToServer.joinAdmin, payload: {}).toJson()));
  }

  final _connectionCountSubj = BehaviorSubject<int>.seeded(0);

  Stream<int> get connectionCount => _connectionCountSubj.stream;

  final adminSessionNtf = ValueNotifier<Session?>(null);
  final _listFakeSbj = BehaviorSubject<List<FakeUser>>.seeded([]);
  final _selectedFakeUserSbj = BehaviorSubject<FakeUser?>.seeded(null);
  String _setToken(String token) => 'Bearer $token';
  Stream<FakeUser?> get selectedFakeStream => _selectedFakeUserSbj.stream;

  Future<void> adminLogin() async {
    final resp = await _api.login(
      EmailCredentialDto(email: 'admin@admin.dev', password: 'admin_password'),
    );
    final session = resp.body;
    if (session != null) {
      setAdminSession(Session.fromDto(session));
    }
  }

  void setInfo(int value) {
    _connectionCountSubj.add(value);
  }

  void setAdminSession(Session session) {
    adminSessionNtf.value = session;
  }

  Stream<List<FakeUser>> get listFakeStream => _listFakeSbj.stream;
  void selectFakeUser(FakeUser? user) {
    _selectedFakeUserSbj.value = user;
  }

  Future<void> createFakeUser(
    String email,
    String password, {
    retryCount = 0,
  }) async {
    if (retryCount > 3) return;
    final token = adminSessionNtf.value?.accessToken;
    if (token == null) {
      final refresh = adminSessionNtf.value?.refreshToken;
      if (refresh == null) {
        throw Exception('Admin session failed');
      }
      await refreshAdminSession();
      await createFakeUser(email, password, retryCount: retryCount + 1);
      return;
    }
    final response = await _api.createFakeUser(
      _setToken(token),
      EmailCredentialDto(email: email, password: password),
    );
    final dto = response.body;
    if (dto != null) {
      final fakeUser = FakeUser.fromDto(dto);
      _listFakeSbj.value.add(fakeUser);
    }
  }

  Future<void> getListFakes({retryCount = 0}) async {
    if (retryCount > 3) return;
    final token = adminSessionNtf.value?.accessToken;
    if (token == null) {
      final refresh = adminSessionNtf.value?.refreshToken;
      if (refresh == null) {
        throw Exception('Admin session failed');
      }
      await refreshAdminSession();
      await getListFakes(retryCount: retryCount + 1);
      return;
    }
    final response = await _api.getListFakes(_setToken(token));
    debugPrint('$green FAKES ${response.statusCode} ${response.body} $reset');
    final dtoList = response.body;
    if (dtoList != null) {
      _listFakeSbj.value = dtoList.map(FakeUser.fromDto).toList();
    }
  }

  Future<void> sessionFromFakeUser(FakeUser fakeUser) async {
    // if (fakeUser.session == null) {
    //   await _api.login(fakeUser.user.email, fakeUser.user.email);
    //   return;
    // }
  }

  Future<void> refreshAdminSession() async {
    final refresh = adminSessionNtf.value?.refreshToken;
    if (refresh == null) {
      throw Exception('Admin session failed');
    }
    await _api.refresh(RefreshTokenDto(refresh));
  }
}
