part of 'chat_member.bloc.dart';

sealed class ChatMemberState extends Equatable {
  const ChatMemberState();
  const factory ChatMemberState.initial() = InitialState;
  const factory ChatMemberState.success(List<String> memberIds) = SuccessState;

  @override
  List<Object?> get props => [];
}

class InitialState extends ChatMemberState {
  const InitialState();
}

class SuccessState extends ChatMemberState {
  const SuccessState(this.memberIds);
  final List<String> memberIds;

  @override
  List<Object?> get props => [memberIds];
}
