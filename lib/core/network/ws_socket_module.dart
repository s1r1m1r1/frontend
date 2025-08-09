import 'package:injectable/injectable.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../../features/auth/domain/auth_repository.dart';
import '../../inject/app_config.dart';

@module
abstract class WsSocketModule {
  @lazySingleton
  WebSocket ws(AppConfig appConfig, AuthRepository auth) => WebSocket(Uri.parse(appConfig.webSocketBaseUrl));
}
