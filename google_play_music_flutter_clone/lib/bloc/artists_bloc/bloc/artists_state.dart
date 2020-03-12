part of 'artists_bloc.dart';

abstract class ArtistsState extends Equatable {
  const ArtistsState();
}


class ArtistsInitial extends ArtistsState {
  @override
  List<Object> get props => [];
}


class ArtistsLoaded extends ArtistsState {
  final List<Song> allArtistsList;

  ArtistsLoaded({this.allArtistsList});
  @override
  List<Object> get props => [];
}

class NoArtistsAvailable extends ArtistsState {
  final String message;

  NoArtistsAvailable(this.message);
  @override
  List<Object> get props => [message];
}