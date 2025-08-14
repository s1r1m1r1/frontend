import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';
import 'package:web_socket_client/web_socket_client.dart' show ConnectionState, Connected, Reconnected;

import '../../ws_counter/domain/ws_config_repository.dart';
part 'letters_event.dart';
part 'letters_state.dart';

@injectable
class LettersBloc extends Bloc<LettersEvent, LettersState> {
  final WsLettersRepository _lettersRepository;
  final WsConfigRepository _wsConfigRepository;
  final WsManager _wsManager;
  String? _roomId;
  StreamSubscription? _lettersSubscription;
  StreamSubscription<ConnectionState>? _connectionSubscription;
  LettersBloc(this._lettersRepository, this._wsManager, this._wsConfigRepository) : super(const LettersState()) {
    on<_StartedLE>(_onStarted);
    on<_DeletePressedLE>(_onDeletePressed);
    on<_NewPressedLE>(_onNewPressed);
    on<_OnUpdateLE>(_onUpdateLetters);
    on<_ConnectionStateUpdateLE>(_onConnectionStateChanged);
  }

  FutureOr<void> _onStarted(_StartedLE event, Emitter<LettersState> emit) async {
    final config = await _wsConfigRepository.getConfig();
    if (config == null) {
      return;
    }
    _roomId = config.lettersRoom;
    _lettersRepository.joinRoom(_roomId!);
    _lettersSubscription = _lettersRepository.letters.listen((letters) => add(_OnUpdateLE(letters)));
    _connectionSubscription = _wsManager.connection.listen((state) {
      add(_ConnectionStateUpdateLE(state));
    });
  }

  FutureOr<void> _onDeletePressed(_DeletePressedLE event, Emitter<LettersState> emit) async {
    if (_roomId == null) {
      return;
    }
    _lettersRepository.deleteLetter(_roomId!, event.letterId);
  }

  FutureOr<void> _onUpdateLetters(_OnUpdateLE event, Emitter<LettersState> emit) {
    emit(state.copyWith(letters: event.letters));
  }

  FutureOr<void> _onConnectionStateChanged(_ConnectionStateUpdateLE event, Emitter<LettersState> emit) async {
    if (_roomId == null) {
      return;
    }
    emit(state.copyWith(status: event.state.toStatus()));
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    _lettersSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onNewPressed(_NewPressedLE event, Emitter<LettersState> emit) async {
    if (_roomId == null) {
      return;
    }
    _lettersRepository.newLetter(
      _roomId!,
      LetterDto(chatRoomId: 1, senderId: 0, content: event.message, createdAt: DateTime.now()),
    );
  }
}

extension on ConnectionState {
  LettersStatus toStatus() {
    return this is Connected || this is Reconnected ? LettersStatus.connected : LettersStatus.disconnected;
  }
}
