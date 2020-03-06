import 'dart:async';
import 'package:meta/meta.dart';


import 'package:google_play_music_flutter_clone/utils/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

abstract class ArtistRepository{

 Future<List<Song>> fetchArtists();

}

class ArtistRepositoryImpl implements ArtistRepository{
  
  final SqlDbClient sqlDbClient;

  ArtistRepositoryImpl({@required this.sqlDbClient});

  Future<List<Song>> fetchArtists() async {
    return sqlDbClient.fetchArtists();
  }
    
}