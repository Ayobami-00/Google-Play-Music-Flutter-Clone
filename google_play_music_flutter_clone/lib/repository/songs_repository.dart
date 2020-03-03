import 'dart:async';


import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

class SongRepository {
  
  SqlDbClient sqlDbClient;

  Future insertSongToDatabase(Song song) async {
    return sqlDbClient.insertSong(song);
  }


  Future<int> updateSongListInDatabase(Song song) async {
    return sqlDbClient.updateSongList(song);
  }


  Future<bool> checkIfSongsAreLoaded(Song song) async {
    return sqlDbClient.isAlreadyLoaded();
  }


  Future<List<Song>> fetchAllSongs(Song song) async {
    return sqlDbClient.fetchSongs();
  }

  Future<List<Song>> fetchSongsByArtist(String artist) async {
    return sqlDbClient.fetchSongsByArtist(artist);
  }


  Future<List<Song>> fetchSongsByGenre(String genre) async {
    return sqlDbClient.fetchSongsByGenre(genre);
  }

  Future<List<Song>> fetchTopSongs(String genre) async {
    return sqlDbClient.fetchTopSong();
  }

  Future<int> updateSong(Song song) async {
    return sqlDbClient.updateSong(song);
  }

  Future<bool> checkIFASongIsFav(Song song) async {
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