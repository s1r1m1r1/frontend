import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/auth_repository.dart';
import '../../domain/auth_status.dart';

import 'with_token.event.dart';
import 'with_token.state.dart';

export 'with_token.event.dart';
export 'with_token.state.dart';

@injectable
class WsWithTokenBloc extends Bloc<WithTokenEvent, WithTokenStatus> {
  final AuthRepository _auth;

  WsWithTokenBloc(this._auth) : super(WithTokenStatus.initial) {
    on<SubscribeEvent>(_onSubscribe);
  }
  FutureOr<void> _onSubscribe(SubscribeEvent event, Emitter<WithTokenStatus> emit) async {
    await emit.onEach(
      Rx.combineLatest3(_auth.accessTokenStream, _auth.refreshTokenStream, _auth.authStatusStream, (
        token,
        refresh,
        authStatus,
      ) {
        if (authStatus == AuthStatus.loggedIn) {
          return WithTokenStatus.authorized;
        }
        if (token != null && authStatus == AuthStatus.pending) {
          return WithTokenStatus.hasToken;
        }
        if (refresh != null && authStatus == AuthStatus.pending) {
          return WithTokenStatus.hasRefresh;
        }
        return WithTokenStatus.unauthorized;
      }),
      onData: (status) {
        switch (status) {
          case WithTokenStatus.hasToken:
            emit(status);
            emit(WithTokenStatus.joinWithToken);
            _auth.wsWithToken();
          case WithTokenStatus.hasRefresh:
            emit(status);
            emit(WithTokenStatus.joinWithRefresh);
            _auth.wsWithRefresh();
          case WithTokenStatus.unauthorized:
          case WithTokenStatus.authorized:
            emit(state);
          case WithTokenStatus.initial:
          case WithTokenStatus.joinWithToken:
          case WithTokenStatus.joinWithRefresh:
            break;
        }
        emit(status);
      },
    );
  }
}
