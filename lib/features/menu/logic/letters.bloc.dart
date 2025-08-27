import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/network/ws_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sha_red/sha_red.dart';

part 'letters.event.dart';
part 'letters.state.dart';
part 'letters.bloc.freezed.dart';

@injectable
class LettersBloc extends Bloc<LettersEvent, LettersState> {
  final WsRepository _wsRepository;
  final int _roomId;
  final int _senderId;
  LettersBloc(
    this._wsRepository,
    @factoryParam this._roomId,
    @factoryParam this._senderId,
  ) : super(const LettersState()) {
    on<_JoinRoomLE>(_onJoinRoom);
    on<_DeletePressedLE>(_onDeletePressed);
    on<_NewPressedLE>(_onNewPressed);
    on<_SubscribedLE>(_onSubscribed);
  }

  FutureOr<void> _onSubscribed(
    _SubscribedLE event,
    Emitter<LettersState> emit,
  ) async {
    await emit.forEach(
      _wsRepository.toClientStream.whereType<LetterTC>(),
      onData: (LetterTC data) {
        switch (data) {
          case LetterHistoryTC():
            return state.copyWith(letters: data.dto.letters);
          case OnLetterTC():
            final updated = List.of(state.letters)..add(data.dto.letter);
            return state.copyWith(letters: updated);
          case DeletedLetterTC():
            final index = state.letters.indexWhere(
              (i) => i.id == data.dto.letterId,
            );
            if (index != -1) {
              final updated = List.of(state.letters)..removeAt(index);
              return state.copyWith(letters: updated);
            }
            break;
        }
        return state;
      },
    );
  }

  FutureOr<void> _onJoinRoom(
    _JoinRoomLE event,
    Emitter<LettersState> emit,
  ) async {
    final dto = ToServer.joinLetters(_roomId);
    _wsRepository.toServer(dto);
  }

  FutureOr<void> _onDeletePressed(
    _DeletePressedLE event,
    Emitter<LettersState> emit,
  ) async {
    final dto = ToServer.deleteLetter(
      roomId: _roomId,
      letterId: event.letterId,
    );
    _wsRepository.toServer(dto);
  }

  FutureOr<void> _onNewPressed(
    _NewPressedLE event,
    Emitter<LettersState> emit,
  ) async {
    final dto = ToServer.newLetter(
      letter: CreateLetterDto(
        roomId: _roomId,
        senderId: _senderId,
        content: event.message,
      ),
    );
    _wsRepository.toServer(dto);
  }
}
