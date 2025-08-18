import 'package:freezed_annotation/freezed_annotation.dart';
part 'ws_game_option.freezed.dart';

@freezed
abstract class WsGameOption with _$WsGameOption {
  const factory WsGameOption({required String mainRoomId}) = _WsSettings;
}
