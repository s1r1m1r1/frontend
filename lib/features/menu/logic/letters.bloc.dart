import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

part 'letters.event.dart';
part 'letters.state.dart';

@injectable
class LettersBloc extends Bloc<LettersEvent, LettersState> {
  final WsLettersRepository _lettersRepository;
  final AuthRepository _authRepository;
  String? _roomId;
  StreamSubscription? _lettersSubscription;
  LettersBloc(this._lettersRepository, this._authRepository)
    : super(const LettersState()) {
    on<_StartedLE>(_onStarted);
    on<_DeletePressedLE>(_onDeletePressed);
    on<_NewPressedLE>(_onNewPressed);
    on<_OnUpdateLE>(_onUpdateLetters);
  }

  FutureOr<void> _onStarted(
    _StartedLE event,
    Emitter<LettersState> emit,
  ) async {
    // final config = await _wsConfigRepository.getConfig();
    // if (config == null) {
    //   return;
    // }
    // _roomId = config.lettersRoom;
    _lettersRepository.joinRoom(_roomId!);
    _lettersSubscription = _lettersRepository.letters.listen(
      (letters) => add(_OnUpdateLE(letters)),
    );
  }

  FutureOr<void> _onDeletePressed(
    _DeletePressedLE event,
    Emitter<LettersState> emit,
  ) async {
    if (_roomId == null) {
      return;
    }
    _lettersRepository.deleteLetter(_roomId!, event.letterId);
  }

  FutureOr<void> _onUpdateLetters(
    _OnUpdateLE event,
    Emitter<LettersState> emit,
  ) {
    emit(state.copyWith(letters: event.letters));
  }

  @override
  Future<void> close() {
    _lettersSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onNewPressed(
    _NewPressedLE event,
    Emitter<LettersState> emit,
  ) async {
    if (_roomId == null) {
      return;
    }
    _lettersRepository.newLetter(
      _roomId!,
      CreateLetterDto(chatRoomId: 1, senderId: 0, content: event.message),
    );
  }
}
