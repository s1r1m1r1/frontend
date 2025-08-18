part of 'app_stage.bloc.dart';

@freezed
abstract class AppStageState with _$AppStageState {
  const AppStageState._();
  const factory AppStageState.initial() = Initial_AS;
  const factory AppStageState.loading() = Loading_AS;
  const factory AppStageState.success() = Success_AS;
  const factory AppStageState.failure() = Failure_AS;
}
