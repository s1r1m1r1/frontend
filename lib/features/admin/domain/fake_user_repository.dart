import 'package:flutter/widgets.dart';
import 'package:frontend/features/admin/domain/fake_user.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FakeUserRepository {
  final SessionRepository _sessionRepository;
  final AuthRepository _authRepository;
  FakeUserRepository(this._sessionRepository, this._authRepository);

  final fakeUsersListNtf = ValueNotifier<List<FakeUser>>([]);
  final selectedFakeUserNtf = ValueNotifier<FakeUser?>(null);
  void selectFakeUser(FakeUser? user) {
    selectedFakeUserNtf.value = user;
  }

  void createFakeUser(String email, String password) {
    fakeUsersListNtf.value.add(FakeUser(email: email, password: password));
  }

  Future<void> sessionFromFakeUser(FakeUser fakeUser) async {
    _authRepository.logOut();
    if (fakeUser.session == null) {
      await _authRepository.login(fakeUser.email, fakeUser.password);
      return;
    }
    _sessionRepository.setSession(fakeUser.session!);
  }
}
