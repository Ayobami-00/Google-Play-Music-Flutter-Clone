part of 'albums_bloc.dart';

abstract class AlbumsState extends Equatable {
  const AlbumsState();
}

class AlbumsInitial extends AlbumsState {
  @override
  List<Object> get props => [];
}

class AlbumsLoaded extends AlbumsState {
  final List<Song> allAlbumsList;

  AlbumsLoaded({this.allAlbumsList});
  @override
  List<Object> get props => [];
}

class NoAlbumsAvailable extends AlbumsState {
  final String message;

  NoAlbumsAvailable(this.message);
  @override
  List<Object> get props => [message];
}

