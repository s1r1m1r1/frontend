// import 'package:equatable/equatable.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:injectable/injectable.dart';

// import '../domain/main_chat_repository.dart';
// part 'ws_manager.event.dart';
// part 'ws_manager.state.dart';

// @injectable
// class WsManagerBloc extends Bloc<WsManagerEvent, WsManagerState> {
//   final MainChatRepository _mainChatRepository;
//   StreamSubscription<List<String>>? _subscription;

//   WsManagerBloc(this._mainChatRepository) : super(const WsManagerState.initial()) {
//     on<_Started>(_onStarted);
//     on<_MembersUpdated>(_onMembersUpdated);
//   }

//   @override
//   Future<void> close() {
//     _subscription?.cancel();
//     return super.close();
//   }

//   FutureOr<void> _onMembersUpdated(_MembersUpdated event, Emitter<WsManagerState> emit) async {
//     emit(WsManagerState.success(event.memberIds));
//   }

//   FutureOr<void> _onStarted(_Started event, Emitter<WsManagerState> emit) async {
//     _mainChatRepository.joinRoom();
//     await emit.forEach(
//       _mainChatRepository.onlineMembers,
//       onData: (members) {
//         return WsManagerState.success(members);
//       },
//     );
//   }
// }
