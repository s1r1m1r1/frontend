import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:sha_red/sha_red.dart';

import '../../unit/domain/unit.dart';
import 'user.dart';
part 'session.freezed.dart';

@freezed
sealed class Session with _$Session {
  const Session._();

  const factory Session.pending({
    required String accessToken,
    required String refreshToken,
  }) = PendingSession;

  @Implements<ISessionUser>()
  const factory Session.welcome({
    required String accessToken,
    required String refreshToken,
    required User user,
  }) = WelcomeSession;

  @Implements<ISessionUser>()
  @Implements<ISessionUnit>()
  const factory Session.gameReady({
    required User user,
    required Unit unit,
    required String accessToken,
    required String refreshToken,
  }) = GameReadySession;

  @Implements<ISessionUser>()
  @Implements<ISessionUnit>()
  @Implements<ISessionWS>()
  const factory Session.gameJoined({
    required User user,
    required Unit unit,
    required String accessToken,
    required String refreshToken,
    required WsGameOption gameOption,
  }) = GameJoinedSession;

  @Implements<ISessionUser>()
  @Implements<ISessionUnit>()
  @Implements<ISessionWS>()
  const factory Session.gameFinished({
    required User user,
    required Unit unit,
    required String accessToken,
    required String refreshToken,
    required WsGameOption gameOption,
  }) = GameFinishedSession;

  factory Session.fromDto(SessionDto dto) {
    final user = User.fromDto(dto.user);
    if (dto.unit != null) {
      return Session.gameReady(
        user: user,
        unit: Unit.fromDto(dto.unit!),
        accessToken: dto.tokens.accessToken,
        refreshToken: dto.tokens.refreshToken,
      );
    }

    return WelcomeSession(
      accessToken: dto.tokens.accessToken,
      refreshToken: dto.tokens.refreshToken,
      user: user,
    );
  }
}

sealed class ISessionUser implements Session {
  User get user;
}

sealed class ISessionUnit implements Session {
  Unit get unit;
}

sealed class ISessionWS implements Session {
  WsGameOption get gameOption;
}
