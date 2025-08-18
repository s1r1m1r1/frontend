import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/menu/domain/main_chat_repository.dart';
import 'package:frontend/features/menu/domain/ws_repository.dart';
import 'package:frontend/inject/app_config.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'package:sha_red/sha_red.dart';

import '../../features/admin/_domain/admin_repository.dart';

@lazySingleton
class WsManager {
  // final WsCounterRepository _counterRepository;
  final WsLettersRepository _lettersRepository;
  final AuthRepository _authRepository;
  final AdminRepository _adminRepository;
  final AppConfig _appConfig;
  final MainChatRepository _mainChatRepository;

  late WebSocket _ws;
  WsManager(
    // this._counterRepository,
    this._lettersRepository,
    this._adminRepository,
    // this._mainChatRepository,
    this._ws,
    this._appConfig,
    this._authRepository,
    this._mainChatRepository,
  ) {
    _listen();
    // _counterRepository.send = send;
    _lettersRepository.send = send;
    _adminRepository.send = send;
    _authRepository.wsSend = send;
    _mainChatRepository.send = send;
  }

  /// Send an increment message to the server.
  void send(dynamic data) {
    debugPrint('send $data\n\n');
    debugPrint('${_ws.connection.state.runtimeType}');
    _ws.send(data);
  }

  StreamSubscription? _wsSubscription;

  /// this is  Steam
  Connection get connection => _ws.connection;

  void _listen() {
    _wsSubscription = _ws.messages.listen((rawData) async {
      final decoded = jsonDecode(rawData);
      debugPrint(
        '$yellow rawData$reset ${rawData.runtimeType} \n\n ${decoded.toString()}',
      );
      final freezed = ToClient.fromJson(decoded as Json);
      switch (freezed) {
        case JoinedServer_TC(
          :final tokens,
          :final mainRoomId,
          :final user,
          :final unit,
        ):
          _authRepository.wsJoinedSession(
            mainRoomId,
            user,
            unit,
            tokens: tokens,
          );

          break;

        case OnlineUsers_TC(:final dto):
          debugPrint('green count: ${dto.members.length} $reset');
          _mainChatRepository.setOnlineMembers(dto.members);
          break;
        case Letters_TC(:final dto):
          _lettersRepository.setLetters(dto.letters);
          break;
        case OnLetter_TC(:final dto):
          _lettersRepository.onLetter(dto.letter);
          break;
        case DeletedLetter_TC(:final dto):
          _lettersRepository.onLetterDeleted(dto.letterId);
          break;
        case StatusError_TC(:final error):
          switch (error) {
            case WsServerError.goingAway:
              break;
            case WsServerError.unsupportedData:
              break;
            case WsServerError.invalidFramePayloadData:
              break;
            case WsServerError.messageTooBig:
              break;
            case WsServerError.internalError:
              break;
            case WsServerError.serviceRestart:
              break;
            case WsServerError.tryAgainLater:
              break;
            case WsServerError.timeout:
              debugPrint('$red [WsManager] timeout  $reset');
              break;
            case WsServerError.unitNotFound:
              // Todo to create page , and reconnect ws
              break;
            case WsServerError.authenticationFailed:
            case WsServerError.sessionExpired:
              break;
            // _authRepository.logOut();
            case WsServerError.unauthorized:
              break;
            case WsServerError.invalidToken:
              _authRepository.onTokenExpired();
              _authRepository.wsJoin();
              break;
            case WsServerError.sessionAlreadyRegistered:
              debugPrint('$red [WsManager] session AlreadyRegistered $reset');
              break;
            case WsServerError.unknown:
            case WsServerError.unknownFormat:
              debugPrint('$red [WsManager] unknown error $reset');
              break;
            case WsServerError.finishDuplicateSession:
              debugPrint('$red [WsManager] finishDuplicateSession $reset');
          }
      }
    });
  }

  void Function(List<String> usersIds)? onlineHandler;

  /// Close the connection.
  void close() => _ws.close();
  @disposeMethod
  void dispose() {
    _wsSubscription?.cancel();
    _ws.close();
  }
}

typedef WsCallback = void Function(dynamic data);

@lazySingleton
class WsLettersRepository {
  WsCallback? send;

  final _lettersSubj = BehaviorSubject<List<LetterDto>>.seeded([]);

  Stream<List<LetterDto>> get letters => _lettersSubj.stream;

  void newLetter(String roomId, CreateLetterDto letter) {
    send?.call(ToServer.newLetter(roomId, letter).encoded());
  }

  void joinRoom(String roomId) {
    send?.call(ToServer.joinLetters('main').encoded());
  }

  void deleteLetter(String roomId, int letterId) {
    final encoded = ToServer.deleteLetter(roomId, letterId).encoded();

    send?.call(encoded);
  }

  void leaveRoom(String roomId) {
    // send?.call(jsonEncode(WsToServer(eventType: WsEventToServer.leaveRoom, payload: {'roomId': roomId}).toJson()));
  }

  // void listRooms() {
  //   send?.call(
  //     jsonEncode(WsToServer(roomId: roomId, eventType: WsEventToServer.listRooms, payload: {}).toJson()),
  //   );
  // }

  void sendLetterToRoom(String roomId, LetterDto letter) {
    // send?.call(
    //   jsonEncode(
    //     WsToServer(
    //       roomId: roomId,
    //       eventType: WsEventToServer.sendLetterToRoom,
    //       payload: {'roomId': roomId, 'letter': letter.toJson()},
    //     ).toJson(),
    //   ),
    // );
  }

  void fetchRoomHistory(String roomId) {
    // send?.call(
    //   jsonEncode(WsToServer(eventType: WsEventToServer.fetchRoomHistory, payload: {'roomId': roomId}).toJson()),
    // );
  }

  void setLetters(List<LetterDto> letters) {
    _lettersSubj.add(letters);
  }

  void onLetter(LetterDto letter) {
    setLetters(List.of(_lettersSubj.value)..add(letter));
  }

  @disposeMethod
  void dispose() {
    send = null;
    _lettersSubj.close();
  }

  void onLetterDeleted(int letterId) {
    debugPrint('ON LETTER DELETED $letterId');
    final copy = List.of(_lettersSubj.value);
    final index = copy.indexWhere((i) => i.id == letterId);

    debugPrint('ON LETTER DELETED INDEX $index ${copy.length}');
    if (index == -1) return;
    copy.removeAt(index);

    debugPrint('ON LETTER DELETED INDEX $index ${copy.length}');
    setLetters(copy);
  }
}
