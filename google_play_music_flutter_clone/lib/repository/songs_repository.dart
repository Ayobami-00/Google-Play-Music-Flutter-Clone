import 'dart:async';
import 'package:meta/meta.dart';


import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

abstract class SongRepository{

  Future<int> insertSongToDatabase(Song song);

  Future<int> updateSongListInDatabase(Song song);

  Future<bool> checkIfSongsAreLoaded(); 

  Future<List<Song>> fetchAllSongs(); 

  Future<List<Song>> fetchSongsByArtist(String artist); 

  Future<List<Song>> fetchSongsByGenre(String genre);

  Future<List<Song>> fetchTopSongs(); 

  Future<int> updateSong(Song song); 

  Future<bool> checkIfASongIsFav(Song song);

  Future<String> makeSongFavourite(Song song);

  Future<Song> fetchLastSong();

  Future<List<Song>> fetchLastAddedSongs();

  Future<List<Song>> fetchFavouriteSongs();

  Future<bool> removeFavSong(Song song); 

  Future<List<Song>> fetchSongById(int id); 
  

}

class SongRepositoryImpl implements SongRepository{
  
  final SqlDbClient sqlDbClient;

  SongRepositoryImpl({@required this.sqlDbClient});

  Future<int> insertSongToDatabase(Song song) async {
    return sqlDbClient.insertSong(song);
  }


  Future<int> updateSongListInDatabase(Song song) async {
    return sqlDbClient.updateSongList(song);
  }


  Future<bool> checkIfSongsAreLoaded() async {
    return sqlDbClient.isAlreadyLoaded();
  }


  Future<List<Song>> fetchAllSongs() async {
    return sqlDbClient.fetchSongs();
  }

  Future<List<Song>> fetchSongsByArtist(String artist) async {
    return sqlDbClient.fetchSongsByArtist(artist);
  }


  Future<List<Song>> fetchSongsByGenre(String genre) async {
    return sqlDbClient.fetchSongsByGenre(genre);
  }

  Future<List<Song>> fetchTopSongs() async {
    return sqlDbClient.fetchTopSong();
  }

  Future<int> updateSong(Song song) async {
    return sqlDbClient.updateSong(song);
  }

  Future<bool> checkIfASongIsFav(Song song) async {
    return sqlDbClient.isfav(song);
  }

  Future<String> makeSongFavourite(Song song) async {
    return sqlDbClient.favouriteSong(song);
  }

  Future<Song> fetchLastSong() async {
    return sqlDbClient.fetchLastSong();
  }

  Future<List<Song>> fetchLastAddedSongs() async {
    return sqlDbClient.fetchLastAddedSongs();
  }

  Future<List<Song>> fetchFavouriteSongs() async {
    return sqlDbClient.fetchFavouriteSongs();
  }

  Future<bool> removeFavSong(Song song) async {
    return sqlDbClient.removeFavSong(song);
  }

  Future<List<Song>> searchSong(String searchString) async {
    return sqlDbClient.searchSong(searchString);
  }

  Future<List<Song>> fetchSongById(int id) async {
    return sqlDbClient.fetchSongById(id);
  }
  
  
}