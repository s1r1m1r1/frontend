part of 'letters_bloc.dart';

sealed class LettersEvent extends Equatable {
  const LettersEvent();
  const factory LettersEvent.started() = _StartedLE;
  const factory LettersEvent.newPressed(String message) = _NewPressedLE;
  const factory LettersEvent.deletePressed(int letterId) = _DeletePressedLE;
  // const factory LettersEvent.onUpdateLetters(List<LetterDto> letters) = _OnUpdateLE;
  const factory LettersEvent.connectionStateChanged(ConnectionState state) = _ConnectionStateUpdateLE;

  @override
  List<Object?> get props => [];
}

class _StartedLE extends LettersEvent {
  const _StartedLE();
}

class _NewPressedLE extends LettersEvent {
  const _NewPressedLE(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}

class _DeletePressedLE extends LettersEvent {
  const _DeletePressedLE(this.letterId);
  final int letterId;
  @override
  List<Object> get props => [letterId];
}

class _OnUpdateLE extends LettersEvent {
  const _OnUpdateLE(this.letters);
  final List<LetterDto> letters;
  @override
  List<Object> get props => [letters];
}

class _ConnectionStateUpdateLE extends LettersEvent {
  const _ConnectionStateUpdateLE(this.state);
  final ConnectionState state;
  @override
  List<Object> get props => [state];
}
