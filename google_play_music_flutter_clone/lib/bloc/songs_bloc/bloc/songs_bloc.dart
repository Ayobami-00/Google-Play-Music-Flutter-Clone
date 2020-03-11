import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/create_repository.dart';
import 'package:google_play_music_flutter_clone/repository/songs_repository.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  static SqlDbClientImpl sqlDbClient = SqlDbClientImpl();
  final songRepository = SongRepositoryImpl(sqlDbClient: sqlDbClient);
  final createRepository  = CreateRepositoryImpl(sqlDbClient: sqlDbClient);
  @override
  SongsState get initialState => SongsInitial();

  @override
  Stream<SongsState> mapEventToState(
    SongsEvent event,
  ) async* {
    if(event is LoadSongs){
      await createRepository.createDatabase();
      List<Song> allSongsList =
          await songRepository.fetchAllSongs();
      if(allSongsList == null || allSongsList.length == 0){
        yield(NoSongsAvailable('No available songs!'));
      }else{
        yield(SongsLoaded(allSongsList: allSongsList));
      }

    }
  }
}
