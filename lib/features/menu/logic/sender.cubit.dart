import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/session.dart';
import 'package:frontend/features/auth/domain/session_repository.dart';
import 'package:injectable/injectable.dart';
part 'sender.state.dart';
part 'sender.cubit.freezed.dart';

abstract class SenderCubit extends Cubit<SenderState> {
  SenderCubit(super.state);
  void changed(ISessionWS sender) => emit(SenderState.selected(sender));
}

@Named('admin')
@Injectable(as: SenderCubit)
class AdminSenderCubit extends SenderCubit {
  AdminSenderCubit() : super(SenderState.initial());
}

@Named('user')
@Injectable(as: SenderCubit)
class UserSenderCubit extends SenderCubit {
  final SessionRepository _sessionRepository;
  StreamSubscription? _sub;
  UserSenderCubit(this._sessionRepository) : super(SenderState.initial());

  void subscribe() {
    _sub?.cancel();
    _sub = _sessionRepository.sessionStream.listen((session) {
      if (session is ISessionWS) {
        changed(session);
      }
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
