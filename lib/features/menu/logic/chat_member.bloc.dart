import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';
import 'package:web_socket_client/web_socket_client.dart';

part 'chat_member.event.dart';
part 'chat_member.state.dart';

const mainRoomId = 'main';

@injectable
class ChatMemberBloc extends Bloc<ChatMemberEvent, ChatMemberState> {
  // final MainChatRepository _mainChatRepository;
  final WsManager _ws;
  StreamSubscription? _connectSub;
  // ---------------------------------------------

  final _onlineMembersSubj = BehaviorSubject<List<String>>.seeded([]);
  Stream<List<String>> get onlineMembers => _onlineMembersSubj.stream;

  //-----------------

  ChatMemberBloc(this._ws) : super(const ChatMemberState.initial()) {
    on<StartedEvent>(_onStarted);
    on<JoinMainEvent>(_onJoinMain);
    on<MembersUpdatedEvent>(_onMembersUpdated);
  }

  @override
  Future<void> close() {
    _connectSub?.cancel();
    return super.close();
  }

  FutureOr<void> _onStarted(StartedEvent event, Emitter<ChatMemberState> emit) async {
    debugPrint('chat member started');
    _ws.onlineHandler = (memberIds) {
      add(ChatMemberEvent.membersUpdated(memberIds));
    };
  }

  FutureOr<void> _onMembersUpdated(MembersUpdatedEvent event, Emitter<ChatMemberState> emit) async {
    emit(ChatMemberState.success(event.memberIds));
  }

  FutureOr<void> _onJoinMain(JoinMainEvent event, Emitter<ChatMemberState> emit) async {
    _connectSub = _ws.connection.listen((state) {
      debugPrint('chat member state ${state.runtimeType} ');
      if (state is Connected) {
        // _ws.send.call(jsonEncode(WsToServer(eventType: WsEventToServer.joinMain, payload: {"user": "test"}).toJson()));
      }
    });

    // await emit.forEach(
    //   _mainChatRepository.onlineMembers,
    //   onData: (members) {
    //     return ChatMemberState.success(members);
    //   },
    // );
  }
}
