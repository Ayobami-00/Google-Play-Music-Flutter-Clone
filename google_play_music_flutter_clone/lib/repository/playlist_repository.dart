import 'dart:async';


import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

class RecentSongsRepository {
  
  SqlDbClient sqlDbClient;

  Future<List<Song>> fetchRecentSongs() async {
    return sqlDbClient.fetchRecentSongs();
  }


  Future<int> insertPlaylistSong(Song song,String playlistTitle) async {
    return sqlDbClient.insertPlaylistSong(song,playlistTitle);
  }

  Future<bool> removePlaylistSong(Song song) async {
    return sqlDbClient.removePlaylistSong(song);
  }
    
}