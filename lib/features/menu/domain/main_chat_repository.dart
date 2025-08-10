import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';

import '../../../core/network/ws_manager.dart';
import '../logic/chat_member.bloc.dart';

@lazySingleton
class MainChatRepository {
  MainChatRepository();
  WsCallback? send;

  final _onlineMembersSubj = BehaviorSubject<List<String>>.seeded([]);
  Stream<List<String>> get onlineMembers => _onlineMembersSubj.stream;

  void setOnlineMembers(List<String> usersIds) => _onlineMembersSubj.value = usersIds;

  void joinRoom() {
    debugPrint('joinRoom send: ${send != null}');
    // send?.call(jsonEncode(WsToServer(eventType: WsEventToServer.joinMain, payload: {}).toJson()));
  }

  @disposeMethod
  void dispose() {
    send = null;
    _onlineMembersSubj.close();
  }
}
