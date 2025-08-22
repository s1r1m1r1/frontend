import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/features/auth/logic/auth_cubit.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';

//   O    IT'S APPLICATION BRO
//  /|\
//  / \

class App extends StatelessWidget {
  final GoRouter router;
  const App({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: _AppView(router),
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
