part of 'letters.bloc.dart';

@freezed
sealed class LettersEvent with _$LettersEvent {
  const LettersEvent._();
  const factory LettersEvent.joinRoom({
    required String roomId,
    required String senderToken,
  }) = _JoinRoomLE;
  const factory LettersEvent.newPressed({
    required String roomId,
    required String message,
    required String senderToken,
  }) = _NewPressedLE;
  const factory LettersEvent.deletePressed(String senderId, int letterId) =
      _DeletePressedLE;
  const factory LettersEvent._onLetter(List<LetterDto> letters) = _OnLetterLE;
  // const factory LettersEvent.onUpdateLetters(List<LetterDto> letters) = _OnUpdateLE;
}
