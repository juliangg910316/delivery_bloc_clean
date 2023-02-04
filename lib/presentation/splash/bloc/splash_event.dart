part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class ValidateSession extends SplashEvent {
  ValidateSession();
}
