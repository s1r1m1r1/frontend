part of 'admin.cubit.dart';

@freezed
abstract class AdminState with _$AdminState {
  const AdminState._();
  const factory AdminState({
    @Default(0) int connectionCount,
    Session? adminSession,
    Session? fakeSession,
    FakeUser? selectedFakeUser,
    @Default([]) List<FakeUser> fakes,
  }) = _AdminState;
}
