part of 'sender.cubit.dart';

@freezed
sealed class SenderState with _$SenderState {
  const SenderState._();
  const factory SenderState.initial() = Initial_SenderS;
  const factory SenderState.selected(ISessionWS sender) = Selected_SenderS;
  ISessionWS? get sender => switch (this) {
    Initial_SenderS() => null,
    Selected_SenderS(:final sender) => sender,
  };
}
