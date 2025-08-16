import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/menu/domain/main_chat_repository.dart';
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
      debugPrint('rawData $rawData');
      debugPrint('rawData ${rawData.runtimeType}');
      final decoded = jsonDecode(rawData);
      final freezed = WWsFromServer.fromJson(decoded as Json);
      switch (freezed) {
        case JoinedServer_WsFromServer(:final dto):
          if (dto.tokens != null) {
            _authRepository.setTokens(dto.tokens!);
          }
          _mainChatRepository.setRoom(dto.mainRoomId);

        case TokenExpired_WsFromServer():
          _authRepository.onTokenExpired();
        case RefreshTokenExpired_WsFromServer():
          _authRepository.onRefreshTokenExpired();
        case OnlineUsers_WsFromServer(:final dto):
          debugPrint('green count: ${dto.members.length} $reset');
          _mainChatRepository.setOnlineMembers(dto.members);

        case Unauthenticated_WsFromServer(:final dto):
          _authRepository.logOut();

        case Letters_WsFromServer(:final dto):
          _lettersRepository.setLetters(dto.letters);

        case OnLetter_WsFromServer(:final dto):
          _lettersRepository.onLetter(dto.letter);

        case DeletedLetter_WsFromServer(:final dto):
          _lettersRepository.onLetterDeleted(dto.letterId);
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
    send?.call(
      jsonEncode(WWsToServer.newLetter(NewLetterPayload(roomId, letter))),
    );
  }

  void joinRoom(String roomId) {
    send?.call(
      jsonEncode(WWsToServer.joinLetters(LetterRoomPayload('main')).toJson()),
    );
  }

  void deleteLetter(String roomId, int letterId) {
    final body = WWsToServer.deleteLetter(
      IdLetterPayload(roomId: roomId, letterId: letterId),
    ).toJson();

    final encoded = jsonEncode(body);

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
