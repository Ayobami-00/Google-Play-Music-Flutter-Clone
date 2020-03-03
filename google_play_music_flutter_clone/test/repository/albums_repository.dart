import 'dart:async';


import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

class SongRepository {
  
  SqlDbClient sqlDbClient;

  Future<List<Song>> fetchAlbum() async {
    return sqlDbClient.fetchAlbum();
  }

  Future<List<Song>> fetchRandomAlbum() async {
    return sqlDbClient.fetchRandomAlbum();
  }
    
}