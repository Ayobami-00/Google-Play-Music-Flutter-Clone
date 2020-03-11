part of 'splash_screen_bloc.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();
}

class CreateDbAndLoadSongsIfNotAlreadyLoaded extends SplashScreenEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}
