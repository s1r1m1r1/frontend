import 'package:equatable/equatable.dart';

abstract class WithTokenEvent extends Equatable {
  const WithTokenEvent();
  @override
  List<Object> get props => [];
}

class SubscribeEvent extends WithTokenEvent {
  const SubscribeEvent();
}
