import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';

mixin LogNotifierMixin<T> on ValueNotifier<T> {
  void log() {
    debugPrint('$magenta$runtimeType$reset $value');
  }
}
