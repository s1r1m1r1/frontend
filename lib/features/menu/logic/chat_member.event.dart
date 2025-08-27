part of 'chat_member.bloc.dart';

@freezed
abstract class ChatMemberEvent with _$ChatMemberEvent {
  const factory ChatMemberEvent.started() = _StartedEvent;
  const factory ChatMemberEvent.subscribe() = _SubscribeEvent;
  const factory ChatMemberEvent.joinMain() = _JoinMainEvent;
  const factory ChatMemberEvent.membersUpdated(
    List<OnlineMemberDto> memberIds,
  ) = _MembersUpdatedEvent;
}
