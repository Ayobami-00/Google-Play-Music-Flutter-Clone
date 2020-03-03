import 'dart:async';


import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

class ArtistsRepository {
  
  SqlDbClient sqlDbClient;

  Future<List<Song>> fetchArtists() async {
    return sqlDbClient.fetchArtists();
  }
    
}