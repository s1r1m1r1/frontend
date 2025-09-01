import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:frontend/core/notifier/log_notifier.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';

@injectable
class LettersNotifier extends LogNotifier<LettersState> {
  final WsRepository _wsRepository;
  final int _roomId;
  final int _senderId;
  StreamSubscription<LetterTC>? _sub;
  LettersNotifier(
    this._wsRepository,
    @factoryParam this._roomId,
    @factoryParam this._senderId,
  ) : super(const LettersState());

  FutureOr<void> subscribed() async {
    _sub?.cancel();
    _sub = _wsRepository.toClientStream.whereType<LetterTC>().listen((
      LetterTC data,
    ) {
      switch (data) {
        case LetterHistoryTC():
          value = value.copyWith(letters: data.dto.letters);
        case OnLetterTC():
          final updated = List.of(value.letters)..add(data.dto.letter);
          value = value.copyWith(letters: updated);
        case DeletedLetterTC():
          final index = value.letters.indexWhere(
            (i) => i.id == data.dto.letterId,
          );
          if (index != -1) {
            final updated = List.of(value.letters)..removeAt(index);
            value = value.copyWith(letters: updated);
          }
          break;
      }
    });
  }

  void joinRoom() {
    final dto = ToServer.joinLetters(_roomId);
    _wsRepository.toServer(dto);
  }

  void deletePressed(int letterId) async {
    final dto = ToServer.deleteLetter(roomId: _roomId, letterId: letterId);
    _wsRepository.toServer(dto);
  }

  FutureOr<void> newPressed(String message) async {
    final dto = ToServer.newLetter(
      letter: CreateLetterDto(
        roomId: _roomId,
        senderId: _senderId,
        content: message,
      ),
    );
    _wsRepository.toServer(dto);
  }
}

enum LettersStatus { connected, disconnected }

class LettersState extends Equatable {
  const LettersState({
    this.updater = false,
    this.letters = const [],
    this.status = LettersStatus.disconnected,
  });

  final List<LetterDto> letters;
  final LettersStatus status;
  final bool updater;

  @override
  List<Object?> get props => [updater, status, letters];

  LettersState copyWith({List<LetterDto>? letters, LettersStatus? status}) {
    return LettersState(
      updater: !updater,
      letters: letters ?? this.letters,
      status: status ?? this.status,
    );
  }
}
