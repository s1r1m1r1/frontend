import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sha_red/sha_red.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const User._();
  const factory User({
    required int id,
    required String email,
    required Role role,
  }) = _User;

  factory User.fromDto(UserDto dto) {
    return User(id: dto.userId, email: dto.email, role: dto.role);
  }
}
