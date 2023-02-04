part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class ChangeIndex extends HomeEvent {
  final int index;

  const ChangeIndex(this.index);

  @override
  List<Object> get props => [index];
}
