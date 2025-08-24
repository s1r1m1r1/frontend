import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';

import '../../../core/network/ws_manager.dart';

@lazySingleton
class MainChatRepository {
  MainChatRepository();
  WsCallback? send;
  final _roomIdSubj = BehaviorSubject<String?>.seeded(null);
  final _onlineMembersSubj = BehaviorSubject<List<OnlineMemberDto>>.seeded([]);
  Stream<String?> get roomIdStream => _roomIdSubj.stream;

  Stream<List<OnlineMemberDto>> get onlineMembers => _onlineMembersSubj.stream;
  void setOnlineMembers(List<OnlineMemberDto> usersIds) =>
      _onlineMembersSubj.value = usersIds;
  @disposeMethod
  void dispose() {
    send = null;
    _onlineMembersSubj.close();
  }
}
