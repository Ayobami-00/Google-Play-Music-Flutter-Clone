part of 'songs_bloc.dart';

abstract class SongsState extends Equatable {
  const SongsState();
}

class SongsInitial extends SongsState {
  @override
  List<Object> get props => [];
}

class SongsLoaded extends SongsState {
  final List<Song> allSongsList;

  SongsLoaded({this.allSongsList});
  @override
  List<Object> get props => [];
}

class NoSongsAvailable extends SongsState {
  final String message;

  NoSongsAvailable(this.message);
  @override
  List<Object> get props => [message];
}
