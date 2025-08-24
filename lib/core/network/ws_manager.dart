import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/app/logger/log_colors.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:frontend/features/menu/domain/main_chat_repository.dart';
import 'package:frontend/inject/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'package:sha_red/sha_red.dart';

enum WsConnectionStatus {
  initial,
  connecting,
  connected,
  disconnecting,
  disconnected,
  reconnecting,
  reconnected,
}

@lazySingleton
class WsManager {
  // final WsCounterRepository _counterRepository;
  final WsLettersRepository _lettersRepository;
  final SessionRepository _sessionRepository;
  final AuthRepository _authRepository;
  final MainChatRepository _mainChatRepository;

  late WebSocket _ws;
  WsManager(
    this._lettersRepository,
    this._sessionRepository,
    this._authRepository,
    this._mainChatRepository,
  ) {
    init();
  }

  void init() {
    _ws = getIt<WebSocket>();
    _lettersRepository.send = send;
    _authRepository.wsSend = send;
    _mainChatRepository.send = send;
    _sessionRepository.wsSend = send;
    _sub?.cancel();
    _sub2?.cancel();
    _listenData();
    _listenStatus();
  }

  /// Send an increment message to the server.
  void send(dynamic data) {
    debugPrint('send $data\n\n');
    debugPrint('${_ws.connection.state.runtimeType}');
    _ws.send(data);
  }

  StreamSubscription? _sub, _sub2;

  final _statusSbj = BehaviorSubject<WsConnectionStatus>.seeded(
    WsConnectionStatus.initial,
  );

  /// this is  Steam
  Stream<WsConnectionStatus> get connection => _statusSbj.stream;

  void restart() {
    _ws.close();
    init();
  }

  void _listenData() {
    _sub = _ws.messages.listen(
      (rawData) async {
        try {
          final decoded = jsonDecode(rawData);

          final freezed = ToClient.fromJson(decoded as Json);
          // debugPrint('$yellow freezed$reset $freezed');
          switch (freezed) {
            case JoinedServerTC(
              :final tokens,
              :final mainRoomId,
              :final user,
              :final unit,
            ):
              _sessionRepository.wsJoinedSession(
                mainRoomId,
                user,
                unit,
                tokens: tokens,
              );

              break;

            case OnlineUsersTC(:final dto):
              // debugPrint('green count: ${dto.members.length} $reset');
              _mainChatRepository.setOnlineMembers(dto.members);
              break;
            case LettersTC(:final dto):
              _lettersRepository.setLetters(dto.letters);
              break;
            case OnLetterTC(:final dto):
              _lettersRepository.onLetter(dto.letter);
              break;
            case DeletedLetterTC(:final dto):
              _lettersRepository.onLetterDeleted(dto.letterId);
              break;
            case StatusErrorTC(:final error):
              switch (error) {
                case WsServerError.goingAway:
                  debugPrint('$red GoingAway $reset');
                  Future.delayed(Duration(seconds: 3), () {
                    restart();
                  });
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
                  // debugPrint('$red [WsManager] timeout  $reset');
                  break;
                case WsServerError.unitNotFound:
                  // Todo to create page , and reconnect ws
                  break;
                // 4001
                case WsServerError.authenticationFailed:
                  break;
                // 4002
                case WsServerError.sessionExpired:
                  _authRepository.logout();
                  break;
                // 4003
                case WsServerError.unauthorized:
                  break;
                // 4004
                case WsServerError.invalidToken:
                  _sessionRepository.onTokenExpired();
                  _sessionRepository.wsJoin();
                  break;
                // 4005
                case WsServerError.sessionAlreadyRegistered:
                  debugPrint(
                    '$red 1) [WsManager] session AlreadyRegistered $reset',
                  );
                  break;
                // 4006
                case WsServerError.finishedDuplicateSession:
                  _sessionRepository.wsSessionFinished();
                  debugPrint(
                    '$red 1) [WsManager] finishDuplicateSession $reset',
                  );
                  break;
                //5555
                case WsServerError.unknown:
                  break;
                // 5556
                case WsServerError.unknownFormat:
                  debugPrint('$red [WsManager] unknown error $reset');
                  break;
                case WsServerError.sessionClosed:
                  debugPrint('$red [WsManager] sessionClosed $reset');
                  break;
                case WsServerError.letterNotRemoved:
                  debugPrint('$red [WsManager] sessionClosed $reset');
              }
          }
        } catch (e) {
          debugPrint('$green [WsManager] error $e $reset');
        }
      },
      onDone: () {
        // called after channel.close();
        debugPrint('$red [WsManager] connectionClosed $reset');
      },

      cancelOnError: true,
    );
  }

  void _listenStatus() {
    _sub = _ws.connection.listen((state) {
      final status = switch (state) {
        Connecting() => WsConnectionStatus.connecting,
        Connected() => WsConnectionStatus.connected,
        Reconnecting() => WsConnectionStatus.reconnecting,
        Reconnected() => WsConnectionStatus.reconnected,
        Disconnecting() => WsConnectionStatus.disconnecting,
        Disconnected() => WsConnectionStatus.disconnecting,
      };
      _statusSbj.add(status);
    });
  }

  @disposeMethod
  void dispose() {
    _sub?.cancel();
    _sub?.cancel();
    _statusSbj.close();
    _ws.close();
  }
}

typedef WsCallback = void Function(dynamic data);

@lazySingleton
class WsLettersRepository {
  WsCallback? send;

  final _lettersSubj = BehaviorSubject<List<LetterDto>>.seeded([]);

  Stream<List<LetterDto>> get letters => _lettersSubj.stream;

  void newLetter(CreateLetterDto letter) {
    send?.call(ToServer.newLetter(letter: letter).encoded());
  }

  void joinRoom(int roomId) {
    send?.call(ToServer.joinLetters(roomId).encoded());
  }

  void deleteLetter({required int roomId, required int letterId}) {
    final encoded = ToServer.deleteLetter(
      roomId: roomId,
      letterId: letterId,
    ).encoded();

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
