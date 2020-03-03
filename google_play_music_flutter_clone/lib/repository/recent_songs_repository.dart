import 'dart:async';


import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

class RecentSongsRepository {
  
  SqlDbClient sqlDbClient;

  Future<List<Song>> fetchRecentSongs() async {
    return sqlDbClient.fetchRecentSongs();
  }


  Future<int> insertRecentSong(Song song) async {
    return sqlDbClient.insertRecentSong(song);
  }

  Future<bool> removeRecentSong(Song song) async {
    return sqlDbClient.removeRecentSong(song);
  }
    
}