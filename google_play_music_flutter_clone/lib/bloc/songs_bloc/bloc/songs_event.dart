part of 'songs_bloc.dart';

abstract class SongsEvent extends Equatable {
  const SongsEvent();
}

class LoadSongs implements SongsEvent{
  @override
  List<Object> get props => null;

  @override
  // TODO: implement stringify
  bool get stringify => null;
}
