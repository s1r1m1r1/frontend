import 'package:equatable/equatable.dart';

class ChatMember extends Equatable {
  const ChatMember({required this.userId, required this.unitName});
  final int userId;
  // final Role role;
  final String unitName;
  @override
  List<Object?> get props => [userId, unitName];
}
