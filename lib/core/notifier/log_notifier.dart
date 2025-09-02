import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:logging/logging.dart';

class LogNotifier<T> extends ValueNotifier<T> {
  static ValueNotifierObserver? observer;
  LogNotifier(super.value) {
    observer?.onCreate(this);
  }

  void log(String message) {
    observer?.log(this, message);
  }

  @override
  void notifyListeners() {
    observer?.onState(this);
    super.notifyListeners();
  }

  void addError(Object error, StackTrace stackTrace) {
    observer?.onError(this, error, stackTrace);
  }

  @override
  void dispose() {
    observer?.onDispose(this);
    super.dispose();
  }
}

class AppValueNotifierObserver extends ValueNotifierObserver {
  AppValueNotifierObserver();
  static const loggerName = 'NtfObs';
  final _log = Logger(loggerName)..level = Level.ALL;
  @override
  void onCreate(ValueNotifier notifier) {
    _log.info('onCreate: ${notifier.runtimeType}');
    super.onCreate(notifier);
  }

  @override
  void onError(ValueNotifier notifier, Object error, StackTrace stackTrace) {
    _log.info(
      '$red${notifier.runtimeType}$reset\n'
      'error:$error\n'
      'stackTrace:$stackTrace',
    );
    super.onError(notifier, error, stackTrace);
  }

  @override
  void log(ValueNotifier notifier, String message) {
    _log.info(
      '{notifier.runtimeType}:\n'
      '$message',
    );
    super.log(notifier, message);
  }

  @override
  void onDispose(ValueNotifier notifier) {
    _log.info('onDispose: ${notifier.runtimeType}');
    super.onDispose(notifier);
  }

  @override
  void onState(ValueNotifier notifier) {
    _log.info(
      'notifyListeners: ${notifier.runtimeType}:\n'
      'value ${notifier.value}',
    );
    super.onState(notifier);
  }
}

abstract class ValueNotifierObserver {
  const ValueNotifierObserver();
  @mustCallSuper
  void onCreate(ValueNotifier notifier) {}

  @mustCallSuper
  void onError(ValueNotifier notifier, Object error, StackTrace stackTrace) {}

  @mustCallSuper
  void log(ValueNotifier notifier, String message) {}

  @mustCallSuper
  void onDispose(ValueNotifier notifier) {}

  @mustCallSuper
  void onState(ValueNotifier notifier) {}
}
