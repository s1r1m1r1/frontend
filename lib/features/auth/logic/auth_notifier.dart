import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthNotifier extends ValueNotifier<Session?> with LogNotifierMixin {
  final SessionRepository _sessionRepository;
  AuthNotifier(this._sessionRepository) : super(null) {
    addListener(log);
  }

  StreamSubscription? _sub;

  void subscribe() {
    _sub?.cancel();
    _sub = _sessionRepository.sessionStream.listen(_listen);
  }

  void _listen(Session? session) {
    value = session;
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
