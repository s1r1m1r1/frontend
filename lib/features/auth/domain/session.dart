import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/domain/ws_game_option.dart';
import 'package:sha_red/sha_red.dart';

import '../../unit/domain/unit.dart';
import 'user.dart';
part 'session.freezed.dart';

@freezed
sealed class Session with _$Session {
  const Session._();

  @Implements<ISessionWithTokens>()
  const factory Session.pending({
    String? accessToken,
    required String refreshToken,
  }) = PendingSession;

  @Implements<ISessionWithTokens>()
  const factory Session.welcome({
    String? accessToken,
    required String refreshToken,

    required User user,
  }) = WelcomeSession;

  @Implements<ISessionWithTokens>()
  const factory Session.gameReady({
    required User user,
    required Unit unit,
    String? accessToken,
    required String refreshToken,
  }) = GameReadySession;

  @Implements<ISessionWithTokens>()
  const factory Session.gameJoined({
    required User user,
    required Unit unit,
    String? accessToken,
    required String refreshToken,
    required WsGameOption gameOption,
  }) = GameJoinedSession;

  @Implements<ISessionWithTokens>()
  const factory Session.gameFinished({
    required User user,
    required Unit unit,
    String? accessToken,
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

abstract class ISessionWithTokens {
  String? get accessToken;
  String get refreshToken;
}
