import 'package:injectable/injectable.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../../inject/app_config.dart';

@module
abstract class WsSocketModule {
  @lazySingleton
  WebSocket wsWithToken(AppConfig appConfig) => WebSocket(Uri.parse(appConfig.webSocketBaseUrl));
}
