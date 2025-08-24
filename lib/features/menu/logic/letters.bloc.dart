import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

part 'letters.event.dart';
part 'letters.state.dart';
part 'letters.bloc.freezed.dart';

@injectable
class LettersBloc extends Bloc<LettersEvent, LettersState> {
  final WsLettersRepository _lettersRepository;
  StreamSubscription? _sub;
  final int _roomId;
  final int _senderId;
  LettersBloc(
    this._lettersRepository,
    @factoryParam this._roomId,
    @factoryParam this._senderId,
  ) : super(const LettersState()) {
    on<_JoinRoomLE>(_onJoinRoom);
    on<_DeletePressedLE>(_onDeletePressed);
    on<_NewPressedLE>(_onNewPressed);
    on<_OnLetterLE>(_onUpdateLetters);
  }

  FutureOr<void> _onJoinRoom(
    _JoinRoomLE event,
    Emitter<LettersState> emit,
  ) async {
    _lettersRepository.joinRoom(_roomId);
    _sub = _lettersRepository.letters.listen(
      (letters) => add(LettersEvent._onLetter(letters)),
    );
  }

  FutureOr<void> _onDeletePressed(
    _DeletePressedLE event,
    Emitter<LettersState> emit,
  ) async {
    _lettersRepository.deleteLetter(roomId: _roomId, letterId: event.letterId);
  }

  FutureOr<void> _onUpdateLetters(
    _OnLetterLE event,
    Emitter<LettersState> emit,
  ) {
    emit(state.copyWith(letters: event.letters));
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  FutureOr<void> _onNewPressed(
    _NewPressedLE event,
    Emitter<LettersState> emit,
  ) async {
    _lettersRepository.newLetter(
      CreateLetterDto(
        roomId: _roomId,
        senderId: _senderId,
        content: event.message,
      ),
    );
  }
}
