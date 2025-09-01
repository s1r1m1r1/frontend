import 'package:equatable/equatable.dart';

import 'dart:async';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';

@lazySingleton
class ChatMemberNotifier extends LogNotifier<ChatMemberState> {
  final WsRepository _wsRepository;
  StreamSubscription<OnlineUsersTC>? _sub;

  ChatMemberNotifier(this._wsRepository)
    : super(const ChatMemberState.initial());

  FutureOr<void> subscribe() async {
    _sub?.cancel();
    _sub = _wsRepository.toClientStream.whereType<OnlineUsersTC>().listen((
      data,
    ) {
      value = ChatMemberState.success(data.dto.members);
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

sealed class ChatMemberState extends Equatable {
  const ChatMemberState();
  const factory ChatMemberState.initial() = InitialState;
  const factory ChatMemberState.success(List<OnlineMemberDto> memberIds) =
      SuccessState;

  @override
  List<Object?> get props => [];
}

class InitialState extends ChatMemberState {
  const InitialState();
}

class SuccessState extends ChatMemberState {
  const SuccessState(this.memberIds);
  final List<OnlineMemberDto> memberIds;

  @override
  List<Object?> get props => [memberIds];
}
