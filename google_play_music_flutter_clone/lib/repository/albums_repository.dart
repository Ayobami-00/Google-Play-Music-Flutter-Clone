import 'dart:async';
import 'package:meta/meta.dart';


import 'package:google_play_music_flutter_clone/utils/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

abstract class AlbumRepository{

  Future<List<Song>> fetchAlbum();
  
  Future<List<Song>> fetchRandomAlbum(); 

}

class AlbumRepositoryImpl implements AlbumRepository{

  final SqlDbClient sqlDbClient;

  AlbumRepositoryImpl({@required this.sqlDbClient});


  Future<List<Song>> fetchAlbum() async {
    return sqlDbClient.fetchAlbum();
  }

  Future<List<Song>> fetchRandomAlbum() async {
    return sqlDbClient.fetchRandomAlbum();
  }
    
}