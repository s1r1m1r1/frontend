import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/user.dart';
import 'package:sha_red/sha_red.dart';

import '../../auth/domain/session.dart';

part 'fake_user.freezed.dart';

@freezed
abstract class FakeUser with _$FakeUser {
  const FakeUser._();
  const factory FakeUser({
    required String email,
    required String password,
    required User user,
    Session? session,
  }) = _FakeUser;

  factory FakeUser.fromDto(FakeUserDto dto) => FakeUser(
    email: dto.email,
    password: dto.password,
    user: User.fromDto(dto.user),
    session: null,
  );
}
