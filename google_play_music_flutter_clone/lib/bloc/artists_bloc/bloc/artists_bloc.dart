import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/artist_repository.dart';
import 'package:google_play_music_flutter_clone/repository/create_repository.dart';

part 'artists_event.dart';
part 'artists_state.dart';

class ArtistsBloc extends Bloc<ArtistsEvent, ArtistsState> {
  static SqlDbClientImpl sqlDbClient = SqlDbClientImpl();
  final artistRepository = ArtistRepositoryImpl(sqlDbClient: sqlDbClient);
  final createRepository  = CreateRepositoryImpl(sqlDbClient: sqlDbClient);
  
  @override
  ArtistsState get initialState => ArtistsInitial();

  @override
  Stream<ArtistsState> mapEventToState(
    ArtistsEvent event,
  ) async* {
    if(event is LoadArtists){
      await createRepository.createDatabase();
      List<Song> allArtistsList =
          await artistRepository.fetchArtists();
      if(allArtistsList == null || allArtistsList.length == 0){
        yield(NoArtistsAvailable('No available Artists!'));
      }else{
        yield(ArtistsLoaded(allArtistsList: allArtistsList));
      }
    }
}
}