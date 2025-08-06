import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

class AppConfig {
  final String httpBaseUrl;
  final String webSocketBaseUrl;

  const AppConfig({required this.httpBaseUrl, required this.webSocketBaseUrl});
}

@module
abstract class AppConfigModule {
  @dev
  @lazySingleton
  AppConfig get appConfigDev => AppConfig(httpBaseUrl: 'http://$host', webSocketBaseUrl: 'ws://$host/ws/');

  @prod
  @lazySingleton
  AppConfig get appConfigProd => AppConfig(httpBaseUrl: 'https://$prodHost', webSocketBaseUrl: 'wss://$prodHost/ws/');
}

// // iOS
const iosHost = '127.0.0.1:8080';
// // android
const androidHost = '127.0.2.2:8080';

const localhost = 'localhost:8080';

const prodHost = 'container-app-rhrbr-universe.containerapps.ru';

final host = switch (defaultTargetPlatform) {
  TargetPlatform.android => androidHost,
  TargetPlatform.iOS => iosHost,
  TargetPlatform.macOS => iosHost,
  _ => localhost,
};
