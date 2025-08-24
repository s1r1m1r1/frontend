import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';
part 'sender.cubit.freezed.dart';

@injectable
class SenderCubit extends Cubit<SenderState> {
  final SessionRepository _sessionRepository;
  SenderCubit(this._sessionRepository) : super(SenderState(null));
  StreamSubscription? _sub;

  void subscribe() {
    _sub?.cancel();
    _sub = _sessionRepository.sessionStream.listen(_listen);
  }

  void _listen(Session? session) {
    if (session is ISessionUnit) {
      emit(SenderState(session.unit.id));
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}

@freezed
abstract class SenderState with _$SenderState {
  const factory SenderState(int? senderId) = _SenderState;
}
