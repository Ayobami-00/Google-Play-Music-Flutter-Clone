part of 'splash_screen_bloc.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();
}


class DatabaseLoading extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class DatabaseLoaded extends SplashScreenState {
  final String message;

  DatabaseLoaded({this.message});
  @override
  List<Object> get props => [message];
}

class NoMusicFound extends SplashScreenState {
  @override
  List<Object> get props => [];
}

