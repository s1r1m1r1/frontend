import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:sha_red/sha_red.dart';

import '../../unit/domain/unit.dart';
import 'user.dart';
part 'session.freezed.dart';

enum SessionError { notFound, expired }

enum WSSessionStatus {
  ready,
  connecting,
  connected,
  disconnected,
  disconnectedByAnother,
}

@freezed
sealed class Session with _$Session {
  const Session._();

  const factory Session.initial() = InitialSession;
  const factory Session.pending() = PendingSession;
  const factory Session.logout(SessionError error) = LogoutSession;

  @Implements<ISessionUser>()
  const factory Session.welcome({required User user}) = WelcomeSession;

  @Implements<ISessionUser>()
  const factory Session.ws({
    required User user,
    required Unit unit,
    WsGameOption? gameOption,
    @Default(WSSessionStatus.ready) WSSessionStatus status,
  }) = WsSession;

  factory Session.fromDto(SessionDto dto) {
    final user = User.fromDto(dto.user);
    if (dto.unit != null) {
      return Session.ws(user: user, unit: Unit.fromDto(dto.unit!));
    }

    return WelcomeSession(user: user);
  }
}

sealed class ISessionUser implements Session {
  User get user;
}
