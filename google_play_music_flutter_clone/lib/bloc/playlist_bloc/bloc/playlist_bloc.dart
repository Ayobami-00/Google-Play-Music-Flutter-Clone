import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/models/playlist_model.dart';
import 'package:google_play_music_flutter_clone/repository/create_repository.dart';
import 'package:google_play_music_flutter_clone/repository/playlist_repository.dart';
import 'package:google_play_music_flutter_clone/repository/songs_repository.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  static SqlDbClientImpl sqlDbClient = SqlDbClientImpl();
  final playlistRepository = PlaylistRepositoryImpl(sqlDbClient: sqlDbClient);
  final songRepository = SongRepositoryImpl(sqlDbClient: sqlDbClient);
  final createRepository  = CreateRepositoryImpl(sqlDbClient: sqlDbClient);
  @override
  PlaylistState get initialState => PlaylistInitial();

  @override
  Stream<PlaylistState> mapEventToState(
    PlaylistEvent event,
  ) async* {
    if (event is SetUpInitialPlaylistState) {
      await createRepository.createDatabase();
      List<Map<String, dynamic>> playlistsList = [];
      List<PlayListDetails> playlistDetails =
          await playlistRepository.fetchPlaylistDetailList();
      if(playlistDetails == null || playlistDetails.length == 0){
        yield(NoPlayistAvailable('No available playlists!'));

      }else{
        playlistDetails.forEach((detail) async {
        Map<String, dynamic> playlistMap = {};
        List<Song> songsByPlaylistName = await playlistRepository
            .fetchPlaylistSongsByPlaylistName(detail.playlistName);
        playlistMap["name"] = detail.playlistName;
        playlistMap["description"] = detail.description;
        playlistMap["songs"] = songsByPlaylistName;
        playlistsList.add(playlistMap);
      });

      List<Song> lastAddedSongsList =
          await songRepository.fetchLastAddedSongs();
      List<Song> favouriteSongsList =
          await songRepository.fetchFavouriteSongs();

      yield (PlaylistLoaded(
        favouriteSongsList: favouriteSongsList,
        lastAddedSongsList: lastAddedSongsList,
        playlistList: playlistsList,
      ));

      }
      
    } else if(event is AddSongToPlaylist){
      await playlistRepository.insertPlaylistSong(event.song, event.playlistTitle);
      yield(SongAddedToPlaylist('Song added to playlist successfully!'));

    }
    else if(event is RemoveSongFromPlaylist){
      await playlistRepository.removePlaylistSong(event.song);
      yield(SongRemovedFromPlaylist('Song removed from playlist successfully!'));

    }
    else if(event is EditPlaylist){
      await playlistRepository.insertPlaylistDetails(event.playListDetails);
      yield(SongAddedToPlaylist('Playlist created successfully!'));

    }
    else if(event is DeletePlaylist){
      await playlistRepository.removePlayListDetails(event.playListDetails);
      yield(SongAddedToPlaylist('Playlist deleted Successfully!'));

    }
  }
}
