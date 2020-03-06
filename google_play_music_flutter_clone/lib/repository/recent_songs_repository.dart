import 'dart:async';
import 'package:meta/meta.dart';


import 'package:google_play_music_flutter_clone/utils/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

abstract class RecentSongRepository {
  Future<List<Song>> fetchRecentSongs();
  Future<int> insertRecentSong(Song song);
  Future<bool> removeRecentSong(Song song);
}

class RecentSongsRepositoryImpl implements RecentSongRepository{
  
  final SqlDbClient sqlDbClient;

  RecentSongsRepositoryImpl({@required this.sqlDbClient});

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