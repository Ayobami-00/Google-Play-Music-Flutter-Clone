part of 'playlist_bloc.dart';

abstract class PlaylistState extends Equatable {
  const PlaylistState();
}

class PlaylistInitial extends PlaylistState {
  
  @override
  List<Object> get props => [];
}

class PlaylistLoaded extends PlaylistState {
  final List<Map<String,dynamic>> playlistList;
  final List<Song> lastAddedSongsList;
  final List<Song> favouriteSongsList;

  PlaylistLoaded({this.playlistList, this.lastAddedSongsList, this.favouriteSongsList});
  @override
  List<Object> get props => [];
}

class NoPlayistAvailable extends PlaylistState {
  final String message;

  NoPlayistAvailable(this.message);
  
  @override
  List<Object> get props => [];
}

class SongAddedToPlaylist extends PlaylistState {
  final String message;

  SongAddedToPlaylist(this.message);
  @override
  List<Object> get props => [];
}

class SongRemovedFromPlaylist extends PlaylistState {
  final String message;
  SongRemovedFromPlaylist(this.message);
  @override
  List<Object> get props => [];
}

class PlaylistEdited extends PlaylistState {
  final String message;

  PlaylistEdited(this.message);
  @override
  List<Object> get props => [];
}

class PlaylistDeleted extends PlaylistState {
  final String message;

  PlaylistDeleted(this.message);
  @override
  List<Object> get props => [];
}
