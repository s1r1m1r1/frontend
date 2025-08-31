import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/app/router/go_router.dart';
import 'package:frontend/features/auth/logic/session.bloc.dart';
import 'package:frontend/features/auth/logic/session_notifier.dart';
import 'package:frontend/features/menu/logic/joined_broadcast_notifier.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';

//   O    IT'S APPLICATION BRO
//  /|\
//  / \

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => getIt<BroadcastInfoNotifier>()..subscribe(),
        ),
        MultiProvider(
          providers: [
            // all singleton notifiers create here , as injectable
            ChangeNotifierProvider.value(
              value: GetIt.I.get<SessionNotifier>()..subscribeWs(),
            ),
            // BlocProvider(create: (_) => SubjectBloc()),
          ],
          child: _AppView(goRouter()),
        ),
      ],
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView(this._router);
  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Your app's localization delegate
        GlobalMaterialLocalizations.delegate, // Material widgets localizations
        GlobalWidgetsLocalizations.delegate, // Basic widgets localizations
        GlobalCupertinoLocalizations
            .delegate, // Cupertino widgets localizations
      ],
      // Cupertino widgets localizations
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
