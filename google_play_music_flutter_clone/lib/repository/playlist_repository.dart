import 'dart:async';
import 'package:google_play_music_flutter_clone/models/playlist_model.dart';
import 'package:meta/meta.dart';


import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

abstract class PlaylistRepository {
  Future<List<PlayListDetails>> fetchPlaylistDetailList();
  Future<int> insertPlaylistDetails(PlayListDetails playlistDetail);
  Future<bool> removePlayListDetails(PlayListDetails playlistDetail);
  Future<List<Song>> fetchPlaylistSongsByPlaylistName(String playlistTitle);
  Future<int> insertPlaylistSong(Song song,String playlistTitle);
  Future<bool> removePlaylistSong(Song song);
}

class PlaylistRepositoryImpl implements PlaylistRepository{

  final SqlDbClient sqlDbClient;

  PlaylistRepositoryImpl({@required this.sqlDbClient});

  Future<List<PlayListDetails>> fetchPlaylistDetailList() async{
    return sqlDbClient.fetchPlaylistDetailList();
  } 

  Future<int> insertPlaylistDetails(PlayListDetails playlistDetail) async{
    return sqlDbClient.insertPlaylistDetails(playlistDetail);
  }

  Future<bool> removePlayListDetails(PlayListDetails playlistDetail) async{
    return sqlDbClient.removePlayListDetails(playlistDetail);
  }

  Future<List<Song>> fetchPlaylistSongsByPlaylistName(String playlistTitle) async {
    return sqlDbClient.fetchPlaylistSongsByPlaylistName(playlistTitle);
  }

  Future<int> insertPlaylistSong(Song song,String playlistTitle) async {
    return sqlDbClient.insertPlaylistSong(song,playlistTitle);
  }

  Future<bool> removePlaylistSong(Song song) async {
    return sqlDbClient.removePlaylistSong(song);
  }

    
}