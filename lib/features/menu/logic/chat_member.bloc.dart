import 'package:equatable/equatable.dart';

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';

part 'chat_member.event.dart';
part 'chat_member.state.dart';
part 'chat_member.bloc.freezed.dart';

const mainRoomId = 'main';

@lazySingleton
class ChatMemberBloc extends Bloc<ChatMemberEvent, ChatMemberState> {
  final WsRepository _wsRepository;

  ChatMemberBloc(this._wsRepository) : super(const ChatMemberState.initial()) {
    on<_SubscribeEvent>(_onSubscribe);
    on<_JoinMainEvent>(_onJoinMain);
    on<_MembersUpdatedEvent>(_onMembersUpdated);
  }

  FutureOr<void> _onMembersUpdated(
    _MembersUpdatedEvent event,
    Emitter<ChatMemberState> emit,
  ) async {
    emit(ChatMemberState.success(event.memberIds));
  }

  FutureOr<void> _onJoinMain(
    _JoinMainEvent event,
    Emitter<ChatMemberState> emit,
  ) async {
    // _connectSub = _ws.connection.listen((state) {
    //   debugPrint('chat member state ${state.runtimeType} ');
    //   if (state is Connected) {
    //     // _ws.send.call(jsonEncode(WsToServer(eventType: WsEventToServer.joinMain, payload: {"user": "test"}).toJson()));
    //   }
    // });

    // await emit.forEach(
    //   _mainChatRepository.onlineMembers,
    //   onData: (members) {
    //     return ChatMemberState.success(members);
    //   },
    // );
  }

  FutureOr<void> _onSubscribe(
    _SubscribeEvent event,
    Emitter<ChatMemberState> emit,
  ) async {
    await emit.forEach(
      _wsRepository.toClientStream.whereType<OnlineUsersTC>(),
      onData: (data) {
        return ChatMemberState.success(data.dto.members);
      },
    );
  }
}
