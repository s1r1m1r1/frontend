import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/network/ws_manager.dart';

@lazySingleton
class MainChatRepository {
  MainChatRepository();
  WsCallback? send;
  final _roomIdSubj = BehaviorSubject<String?>.seeded(null);
  final _onlineMembersSubj = BehaviorSubject<List<String>>.seeded([]);
  Stream<String?> get roomId => _roomIdSubj.stream;

  Stream<List<String>> get onlineMembers => _onlineMembersSubj.stream;
  void setOnlineMembers(List<String> usersIds) => _onlineMembersSubj.value = usersIds;

  void setRoom(String roomId) => _roomIdSubj.add(roomId);

  @disposeMethod
  void dispose() {
    send = null;
    _onlineMembersSubj.close();
  }
}
