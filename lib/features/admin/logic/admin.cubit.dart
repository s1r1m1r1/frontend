import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/admin/domain/admin_repository.dart';
import 'package:frontend/features/admin/domain/fake_user.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

import '../../auth/domain/auth_repository.dart';

part 'admin.cubit.freezed.dart';
part 'admin.state.dart';

@injectable
class AdminCubit extends Cubit<AdminState> {
  final AdminRepository _adminRepository;
  final AuthRepository _authRepository;
  final SessionRepository _sessionRepository;
  StreamSubscription? _sub;
  StreamSubscription? _sub2;
  StreamSubscription? _sub3;
  AdminCubit(
    this._adminRepository,
    this._authRepository,
    this._sessionRepository,
  ) : super(const AdminState()) {
    _init();
  }

  FutureOr<void> login() async {
    try {
      await _authRepository.login('admin@admin.dev', 'admin_password');
      final session = _sessionRepository.session;

      if (session == null && session is! ISessionUser) {
        throw Exception('Admin session failed');
      }
      final user = (session as ISessionUser).user;
      if (user.role != Role.admin) {
        throw Exception('user is not admin');
      }
      _adminRepository.setAdminSession(session!);
      emit(state.copyWith(adminSession: session));
    } catch (e, s) {
      addError(e, s);
    }
  }

  void _init() {
    _sub = _sessionRepository.sessionStream.listen(_listenSession);
    _sub2 = _adminRepository.listFakeStream.listen(_listenFakes);
    _sub3 = _adminRepository.selectedFakeStream.listen(_listenSelectedFake);
  }

  void _listenSession(Session? session) {
    if (session == null && session is! ISessionUser) {
      throw Exception('Admin session failed');
    }
    final user = (session as ISessionUser).user;
    if (user.role != Role.admin) {
      throw Exception('user is not admin');
    }
    _adminRepository.setAdminSession(session!);
    emit(state.copyWith(adminSession: session));
  }

  void _listenFakes(List<FakeUser> fakes) {
    emit(state.copyWith(fakes: fakes));
  }

  void _listenSelectedFake(FakeUser? user) {
    emit(state.copyWith(selectedFakeUser: user));
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    _sub2?.cancel();
    _sub3?.cancel();
    return super.close();
  }

  Future<void> addFake({
    required String password,
    required String email,
  }) async {
    try {
      await _adminRepository.createFakeUser(email, password);
    } catch (e, s) {
      addError(e, s);
    }
  }

  void loadFakes() {
    _adminRepository.getListFakes();
  }

  void selectFake(FakeUser user) {
    _adminRepository.selectFakeUser(user);
  }
}
