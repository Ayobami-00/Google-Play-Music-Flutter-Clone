import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/create_repository.dart';
import 'package:google_play_music_flutter_clone/repository/songs_repository.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  static SqlDbClientImpl sqlDbClient = SqlDbClientImpl();
  final createRepository  = CreateRepositoryImpl(sqlDbClient: sqlDbClient);
  final songRepository  = SongRepositoryImpl(sqlDbClient: sqlDbClient);

  SplashScreenBloc();
  @override
  SplashScreenState get initialState => Empty();

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    yield DatabaseLoading();
    if (event is CreateDbAndLoadSongsIfNotAlreadyLoaded) {
      await createRepository.createDatabase();
      if (await songRepository.checkIfSongsAreLoaded()) {
        print('Songs are already loaded');
        yield DatabaseLoaded();

      } else {
        var all_songs;
        
        try {
          all_songs = await MusicFinder.allSongs();
          List<Song> list = List.from(all_songs);

          if (list == null || list.length == 0) {
            print("List-> $list");

            yield NoMusicFound();
          } else {
            for (Song song in list) {
              await songRepository.insertSongToDatabase(song);
            }
            yield DatabaseLoaded();
            print('Songs are already inserted');
          }
        } catch (e) {
          print("failed to get songs");
        }
      }
    }
  }
}
