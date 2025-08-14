part of 'chat_member.bloc.dart';

abstract class ChatMemberEvent extends Equatable {
  const ChatMemberEvent();
  const factory ChatMemberEvent.started() = StartedEvent;
  const factory ChatMemberEvent.joinMain() = JoinMainEvent;
  const factory ChatMemberEvent.membersUpdated(List<OnlineMemberDto> memberIds) = MembersUpdatedEvent;

  @override
  List<Object?> get props => [];
}

class StartedEvent extends ChatMemberEvent {
  const StartedEvent();
}

class JoinMainEvent extends ChatMemberEvent {
  const JoinMainEvent();
}

class MembersUpdatedEvent extends ChatMemberEvent {
  const MembersUpdatedEvent(this.memberIds);
  final List<OnlineMemberDto> memberIds;
}
