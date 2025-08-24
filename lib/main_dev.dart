import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/app/app_bloc_observer.dart';
import 'package:frontend/inject/inject.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

import 'app/logger/log_colors.dart';
import 'app/logger/logger_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configInjector(GetIt.instance, env: dev.name);
  Bloc.observer = MyBlocObserver();
  hierarchicalLoggingEnabled = true;
  Logger.root.onRecord.listen(watchRecords);

  PlatformDispatcher.instance.onError = (error, stack) {
    if (kDebugMode) {
      debugPrintStack(
        stackTrace: stack,
        label: '${red}PlatformDispatcher$reset$error',
      );
    } else {
      // Sentry.captureException(details.exception, stackTrace: details.stack);
      // FirebaseCrashlytics.instance.recordError(details.exception, details.stack);
    }
    return true;
  };

  FlutterError.onError = (details) {
    if (kDebugMode) {
      // In debug mode, simply print the error to the console
      FlutterError.dumpErrorToConsole(details);
    } else {
      // Sentry.captureException(details.exception, stackTrace: details.stack);
      // FirebaseCrashlytics.instance.recordError(details.exception, details.stack);
    }
  };
  runApp(App());
}
