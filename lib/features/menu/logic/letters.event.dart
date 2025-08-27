part of 'letters.bloc.dart';

@freezed
sealed class LettersEvent with _$LettersEvent {
  const LettersEvent._();
  const factory LettersEvent.subscribed() = _SubscribedLE;
  const factory LettersEvent.joinRoom() = _JoinRoomLE;
  const factory LettersEvent.newPressed(String message) = _NewPressedLE;
  const factory LettersEvent.deletePressed(int letterId) = _DeletePressedLE;
}
