import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'fake_user.state.dart';
part 'fake_user.cubit.freezed.dart';

class FakeUserCubit extends Cubit<FakeUserState> {
  FakeUserCubit() : super(FakeUserState.initial());
}
