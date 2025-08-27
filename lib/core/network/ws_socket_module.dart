import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:frontend/features/menu/domain/main_chat_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../../features/auth/domain/auth_repository.dart';
import '../../inject/app_config.dart';

@module
abstract class WsSocketModule {
  @injectable
  WebSocket ws(AppConfig appConfig, AuthRepository auth) =>
      WebSocket(Uri.parse(appConfig.webSocketBaseUrl));
}
