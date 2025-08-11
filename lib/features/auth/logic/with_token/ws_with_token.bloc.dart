import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/network/ws_manager.dart';
import 'package:frontend/features/menu/domain/main_chat_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_client/web_socket_client.dart' as wsClient;

import '../../domain/auth_repository.dart';
import '../../domain/auth_status.dart';

import 'with_token.state.dart';

export 'with_token.event.dart';
export 'with_token.state.dart';

@injectable
class WsWithTokenBloc extends Bloc<WithTokenEvent, WithTokenState> {
  final AuthRepository _auth;
  final MainChatRepository _mainChat;
  final WsManager _wsManager;
  StreamSubscription? _sub;

  WsWithTokenBloc(this._auth, this._mainChat, this._wsManager) : super(const WithTokenState(WithTokenStatus.initial)) {
    on<SubscribeEvent>(_onSubscribe);
    on<AuthorsTokenChanged>(_onStatusChanged);
  }

  Future<void> _onSubscribe(SubscribeEvent event, Emitter<WithTokenState> emit) async {
    _sub?.cancel();
    _sub =
        Rx.combineLatest5(
          _auth.accessTokenStream,
          _auth.refreshTokenStream,
          _auth.authStatusStream,
          _mainChat.roomId,
          _wsManager.connection,
          (access, refresh, authStatus, roomId, connection) => AuthorsTokenChanged(
            access: access,
            refresh: refresh,
            authStatus: authStatus,
            roomId: roomId,
            connection: connection,
          ),
        ).listen((e) async {
          add(e);
        });
  }

  Future<void> _onStatusChanged(AuthorsTokenChanged e, Emitter<WithTokenState> emit) async {
    final conn = e.connection;
    final status = conn is! wsClient.Connected
        ? WithTokenStatus.unauthorized
        : (e.authStatus == AuthStatus.loggedIn && e.roomId != null)
        ? WithTokenStatus.authorized
        : (e.access != null)
        ? WithTokenStatus.hasToken
        : (e.refresh != null)
        ? WithTokenStatus.hasRefresh
        : WithTokenStatus.unauthorized;
    emit(WithTokenState(status));

    switch (status) {
      case WithTokenStatus.hasToken:
        emit(const WithTokenState(WithTokenStatus.joinWithToken));
        _auth.wsWithToken();
        break;
      case WithTokenStatus.hasRefresh:
        emit(const WithTokenState(WithTokenStatus.joinWithRefresh));
        _auth.wsWithRefresh();
        break;
      default:
        break;
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}

class WithTokenState extends Equatable {
  final WithTokenStatus status;

  const WithTokenState(this.status);
  @override
  List<Object?> get props => [status];
}

abstract class WithTokenEvent {}

class SubscribeEvent extends WithTokenEvent {}

class AuthorsTokenChanged extends WithTokenEvent {
  final String? access, refresh;
  final AuthStatus authStatus;
  final String? roomId;
  final wsClient.ConnectionState connection;

  AuthorsTokenChanged({
    required this.access,
    required this.refresh,
    required this.authStatus,
    required this.roomId,
    required this.connection,
  });
}
