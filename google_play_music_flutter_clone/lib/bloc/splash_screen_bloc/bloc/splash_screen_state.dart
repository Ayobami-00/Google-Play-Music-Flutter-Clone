part of 'splash_screen_bloc.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();
}

class Empty extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class DatabaseLoading extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class DatabaseLoaded extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class NoMusicFound extends SplashScreenState {
  @override
  List<Object> get props => [];
}

