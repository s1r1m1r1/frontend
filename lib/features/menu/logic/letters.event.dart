part of 'letters.bloc.dart';

@freezed
sealed class LettersEvent with _$LettersEvent {
  const LettersEvent._();
  const factory LettersEvent.joinRoom() = _JoinRoomLE;
  const factory LettersEvent.newPressed(String message) = _NewPressedLE;
  const factory LettersEvent.deletePressed(int letterId) = _DeletePressedLE;
  const factory LettersEvent._onLetter(List<LetterDto> letters) = _OnLetterLE;
  // const factory LettersEvent.onUpdateLetters(List<LetterDto> letters) = _OnUpdateLE;
}
