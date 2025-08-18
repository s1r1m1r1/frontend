part of 'app_stage.bloc.dart';

@freezed
abstract class AppStageEvent with _$AppStageEvent {
  const AppStageEvent._();
  const factory AppStageEvent.started() = _StartedEvent;
}
