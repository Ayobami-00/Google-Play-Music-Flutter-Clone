part of 'playlist_bloc.dart';

abstract class PlaylistEvent extends Equatable {
  const PlaylistEvent();
}

class SetUpInitialPlaylistState implements PlaylistEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  // TODO: implement stringify
  bool get stringify => null;

}

class AddSongToPlaylist implements PlaylistEvent{
  final Song song; 
  final String playlistTitle;

  AddSongToPlaylist(this.song, this.playlistTitle);

  @override
  List<Object> get props => [song,playlistTitle];

  @override
  // TODO: implement stringify
  bool get stringify => null;
}

class RemoveSongFromPlaylist implements PlaylistEvent{
  final Song song;

  RemoveSongFromPlaylist(this.song);

  @override
  List<Object> get props => [song];

  @override
  // TODO: implement stringify
  bool get stringify => null;
}

class EditPlaylist implements PlaylistEvent{
  final PlayListDetails playListDetails;

  EditPlaylist(this.playListDetails);
  @override
  List<Object> get props => [playListDetails];

  @override
  // TODO: implement stringify
  bool get stringify => null;
}

class DeletePlaylist implements PlaylistEvent{
  final PlayListDetails playListDetails;

  DeletePlaylist(this.playListDetails);
  @override
  List<Object> get props => null;

  @override
  // TODO: implement stringify
  bool get stringify => null;
}



