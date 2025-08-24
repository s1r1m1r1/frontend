import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';

import '../domain/auth_repository.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final SessionRepository _sessionRepository;
  StreamSubscription? _sub;
  AuthCubit(this._authRepository, this._sessionRepository)
    : super(const AuthState.initial());

  void subscribe() {
    debugPrint('$red AuthCubit subscribe $reset');
    _sub = _sessionRepository.sessionStream.listen(_listen);
  }

  void _listen(Session? session) {
    debugPrint('$red AuthCubit _listen $reset');
    if (session == null) {
      debugPrint('AuthCubit _listen null');
      emit(const AuthState.logout());

      return;
    }
    debugPrint('AuthCubit _listen not null');
    emit(AuthState.authenticated(session: session));
  }

  Future<void> updateSession(Session session) async {
    debugPrint('$red AuthCubit updateSession $reset');
    if (state case AuthenticatedAuthState(isUpdating: true)) return;
    debugPrint('$red AuthCubit updateSession updated$reset');
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
