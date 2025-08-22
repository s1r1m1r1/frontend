import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';

import '../domain/auth_repository.dart';
part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> with ChangeNotifier {
  final AuthRepository _authRepository;
  final SessionRepository _sessionRepository;
  StreamSubscription? _sub;
  AuthCubit(this._authRepository, this._sessionRepository)
    : super(const AuthState.initial());

  void subscribe() {
    _sub?.cancel();
    _sub = _sessionRepository.sessionStream.listen(_listen);
  }

  void _listen(Session? session) {
    if (session == null) {
      emit(const AuthState.logout());
      return;
    }
    emit(AuthState.authenticated(session: session));
    notifyListeners();
  }

  Future<void> updateSession(Session session) async {
    if (state case AuthenticatedAuthState(isUpdating: true)) return;
    emit(AuthState.authenticated(session: session, isUpdating: true));
    try {
      await _authRepository.checkToken();
    } catch (e) {
      emit(
        AuthState.authenticated(
          session: session,
          isUpdating: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    _sub?.cancel();
    return await super.close();
  }
}

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = InitialAuthState;
  const factory AuthState.authenticated({
    required Session session,
    @Default(false) bool isUpdating,
    String? errorMessage,
  }) = AuthenticatedAuthState;
  const factory AuthState.logout() = LogoutAuthState;
}
