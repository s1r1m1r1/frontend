import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/domain/session.dart';

part 'fake_user.freezed.dart';

@freezed
abstract class FakeUser with _$FakeUser {
  const FakeUser._();
  const factory FakeUser({
    required String email,
    required String password,
    Session? session,
  }) = _FakeUser;
}
