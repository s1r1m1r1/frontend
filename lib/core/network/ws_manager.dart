import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/inject/app_config.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'package:sha_red/sha_red.dart';

import '../../features/admin/_domain/admin_repository.dart';

@lazySingleton
class WsManager {
  final WsCounterRepository _counterRepository;
  final WsLettersRepository _lettersRepository;
  final AuthRepository _authRepository;
  final AdminRepository _adminRepository;
  final AppConfig _appConfig;

  late WebSocket _ws;
  WsManager(
    this._counterRepository,
    this._lettersRepository,
    this._adminRepository,
    // this._mainChatRepository,
    this._ws,
    this._appConfig,
    this._authRepository,
  ) {
    _listen();
    _counterRepository.send = send;
    _lettersRepository.send = send;
    _adminRepository.send = send;
    _authRepository.wsSend = send;
  }

  /// Send an increment message to the server.
  void send(dynamic data) => _ws.send(data);
  StreamSubscription? _wsSubscription;

  /// this is  Steam
  Connection get connection => _ws.connection;

  void _listen() {
    _wsSubscription = _ws.messages.listen((rawData) async {
      final decoded = jsonDecode(rawData);
      debugPrint('rawData $rawData');
      final eventType = WsFromServer.enumFromJson(decoded as Json);
      final payload = decoded['payload'];

      switch (eventType) {
        case WsEventFromServer.letterCreated:
          _lettersRepository.onLetter(payload as Json);
          break;
        case WsEventFromServer.joinedCounter:
        case WsEventFromServer.counter:
          _counterRepository.onCount(payload as Json);
          break;
        case WsEventFromServer.letters:
          break;
        // final payload = InitialPayload.fromJson(fromServer.payload as Json);
        // _counterRepository.setCount(payload.counter);
        // _lettersRepository.setLetters(payload.letters.toList());

        case WsEventFromServer.joinedLetters:
          final dto = LettersPayload.fromJson(payload as Json);
          _lettersRepository.setLetters(dto.letters.toList());
        case WsEventFromServer.adminInfo:
        // final payload = IdPayload.fromJson(fromServer.payload as Json);
        // _adminRepository.setInfo(payload.id);
        // case WsEventFromServer.joinedMain:
        // case WsEventFromServer.online:
        // final payload = decoded as List<String>;
        // onlineHandler?.call(payload);
        case WsEventFromServer.loggedIn:
          final dto = TokensDto.fromJson(payload as Json);
          await _authRepository.setTokens(dto);
        case WsEventFromServer.tokenExpired:
          final refreshToken = _authRepository.getRefreshToken();
          if (refreshToken == null) return;
          final dto = RefreshTokenDto(refreshToken);
          send(
            WsToServer(
              // roomId: 'auth',
              eventType: WsEventToServer.withRefresh,
              payload: dto,
            ).toJson(RefreshTokenDto.toJsonF),
          );

        case WsEventFromServer.unauthenticated:
          break;
        case WsEventFromServer.refreshTokenExpired:
          _authRepository.logOut();
          break;
        case WsEventFromServer.onlineUsers:
          // TODO: Handle this case.
          throw UnimplementedError();
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
class WsCounterRepository {
  WsCounterRepository();
  WsCallback? send;

  void joinRoom(String counterRoom) {
    send?.call(
      jsonEncode(
        WsToServer(
          eventType: WsEventToServer.joinCounter,
          payload: WsCounterPayload(roomId: counterRoom),
        ).toJson(WsCounterPayload.toJsonF),
      ),
    );
  }

  void increment(String counterRoom) => send?.call(
    jsonEncode(
      WsToServer(
        eventType: WsEventToServer.incrementCounter,
        payload: WsCounterPayload(roomId: counterRoom),
      ).toJson(WsCounterPayload.toJsonF),
    ),
  );

  void decrement(String counterRoom) => send?.call(
    jsonEncode(
      WsToServer(
        eventType: WsEventToServer.decrementCounter,
        payload: WsCounterPayload(roomId: counterRoom),
      ).toJson(WsCounterPayload.toJsonF),
    ),
  );

  final _counterSubj = BehaviorSubject<int>.seeded(0);

  Stream<int> get countStream => _counterSubj.stream;

  void setCount(int value) => _counterSubj.add(value);
  void onCount(Json rawPayload) {
    final payload = CounterPayload.fromJson(rawPayload);
    setCount(payload.value);
  }

  @disposeMethod
  void dispose() {
    send = null;
    _counterSubj.close();
  }
}

@lazySingleton
class WsLettersRepository {
  WsCallback? send;

  final _lettersSubj = BehaviorSubject<List<LetterDto>>.seeded([]);

  Stream<List<LetterDto>> get letters => _lettersSubj.stream;

  void newLetter(String roomId, LetterDto letter) {
    // send?.call(jsonEncode(WsToServer(eventType: WsEventToServer.newLetter, payload: letter.toJson()).toJson()));
  }

  void joinRoom(String roomId) {
    // send?.call(jsonEncode(WsToServer(eventType: WsEventToServer.joinLetters, payload: {'roomId': roomId}).toJson()));
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

  void onLetter(Json rawPayload) {
    final payload = LetterDto.fromJson(rawPayload);
    setLetters(List.of(_lettersSubj.value)..add(payload));
  }

  @disposeMethod
  void dispose() {
    send = null;
    _lettersSubj.close();
  }
}
