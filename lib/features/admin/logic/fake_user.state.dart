part of 'fake_user.cubit.dart';

@freezed
sealed class FakeUserState with _$FakeUserState {
  const FakeUserState._();
  const factory FakeUserState.initial() = Initial_FakeS;
  const factory FakeUserState.selected(String id) = Selected_FakeS;
}
