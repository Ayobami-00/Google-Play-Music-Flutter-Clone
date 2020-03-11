import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/albums_repository.dart';
import 'package:google_play_music_flutter_clone/repository/create_repository.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  static SqlDbClientImpl sqlDbClient = SqlDbClientImpl();
  final albumsRepository = AlbumRepositoryImpl(sqlDbClient: sqlDbClient);
  final createRepository  = CreateRepositoryImpl(sqlDbClient: sqlDbClient);

  @override
  AlbumsState get initialState => AlbumsInitial();

  @override
  Stream<AlbumsState> mapEventToState(
    AlbumsEvent event,
  ) async* {
    if(event is LoadAlbums){
      await createRepository.createDatabase();
      List<Song> allAlbumsList =
          await albumsRepository.fetchAlbum();
      if(allAlbumsList == null || allAlbumsList.length == 0){
        yield(NoAlbumsAvailable('No available albums!'));
      }else{
        yield(AlbumsLoaded(allAlbumsList: allAlbumsList));
      }
    }
  }
}
