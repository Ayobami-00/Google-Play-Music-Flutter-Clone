part of 'albums_bloc.dart';

abstract class AlbumsEvent extends Equatable {
  const AlbumsEvent();
}

class LoadAlbums implements AlbumsEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  // TODO: implement stringify
  bool get stringify => null;

} 