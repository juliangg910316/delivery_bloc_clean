part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {
  final bool sessionValidated;

  SplashLoaded(this.sessionValidated);

  bool get props => sessionValidated;
}
