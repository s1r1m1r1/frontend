import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class LogNotifier<T> extends ValueNotifier<T> {
  static ValueNotifierObserver? observer;
  LogNotifier(super.value) {
    observer?.onCreate(this);
  }

  void log(String message) {
    observer?.log(this, 'log');
  }

  @override
  void notifyListeners() {
    observer?.onState(this, value);
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
    _log.info('onCreate: $notifier');
    super.onCreate(notifier);
  }

  @override
  void onError(ValueNotifier notifier, Object error, StackTrace stackTrace) {
    _log.info('onError: $notifier, $error, $stackTrace');
    super.onError(notifier, error, stackTrace);
  }

  @override
  void log(ValueNotifier notifier, String message) {
    _log.info('log: $notifier, $message');
    super.log(notifier, message);
  }

  @override
  void onDispose(ValueNotifier notifier) {
    _log.info('onDispose: $notifier');
    super.onDispose(notifier);
  }

  @override
  void onState(ValueNotifier notifier, Object? message) {
    _log.info('onState: $notifier, $message');
    super.onState(notifier, message);
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
  void onState(ValueNotifier notifier, Object? message) {}
}
