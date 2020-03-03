import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flute_music_player/flute_music_player.dart';



class SqlDbClient {
  
  Database _database;
  Song song;

  
  /// This function takes no paramters and creates the database
  Future createDatabase() async{ 
    Directory path = await getApplicationDocumentsDirectory();
    String dbpath = join(path.path, 'google_play_music_flutter_clone.db');
    _database =  await openDatabase(dbpath,version: 1,onCreate: this._create);
  }


  /// This function takes two parameters, one of type Database and another of type int and creates the songs,recent and playlist database
  Future _create(Database _database, int version) async{
    await _database.execute("""
    CREATE TABLE songs(id NUMBER,title TEXT,duration NUMBER,albumArt TEXT,album TEXT,uri TEXT,artist TEXT,albumId NUMBER,genre TEXT,isFav number NOT NULL default 0,timestamp number,count number not null default 0)
    """);
    await _database.execute("""
    CREATE TABLE recents(id integer primary key autoincrement,title TEXT,duration NUMBER,albumArt TEXT,album TEXT,uri TEXT,artist TEXT,albumId NUMBER,genre TEXT)
    """);
    await _database.execute("""
    CREATE TABLE playlist(id integer primary key autoincrement,playlistTitle TEXT,title TEXT,duration NUMBER,albumArt TEXT,album TEXT,uri TEXT,artist TEXT,albumId NUMBER,genre TEXT)
    """);
  }

                                                                      //SONGS QUERIES//

  /// This function takes in a variable of type Song and returns 
  Future<int> insertSong(Song song) async{
    if(!song.count){
      song.count = 0;
    }
    if (!song.timestamp){
      song.timestamp = 0;
    }
    if(!song.isFav){
      song.isFav = 0;
    }

    int id = 0;
    var query = Sqflite.firstIntValue(await _database.
    rawQuery("SELECT COUNT(*) FROM songs WHERE id = ?", [song.id]));
    if(query == 0){
      id = await _database.insert("songs", song.toMap());
    } else {
      await _database.update("songs",song.toMap(), where: "id= ?", whereArgs: [song.id]);
   }

   return id;
  }


  //TODO: Documentation required
  Future<int> updateSongList(Song song) async{
    song.count = 0;
    song.timestamp = DateTime.now().millisecondsSinceEpoch;
    song.isFav = 0;

    int id = 0;
    var query = Sqflite.firstIntValue(await _database
    .rawQuery("SELECT COUNT(*) FROM songs WHERE title = ?", [song.title]));
    if(query == 0){
      id = await _database.insert("songs", song.toMap());
    }
    return id;
  }

  //TODO: Documentation required
  Future<bool> isAlreadyLoaded() async{
    var query = Sqflite.firstIntValue(await _database
    .rawQuery("SELECT COUNT(*) FROM songs"));
    if(query > 0){
      return true;
    }
    else{
      return false;
    }
  }

  //TODO: Documentation required
  Future<List<Song>> fetchSongs() async{
    List<Map> query = await _database.query("songs",columns: Song.Columns,
    orderBy: "title");
    List<Song> songs = List();
    query.forEach((s){
      Song song = Song.fromMap(s);
      songs.add(song);
    });
    return songs;
  }


  //TODO: Documentation required
  Future<List<Song>> fetchSongsByArtist(String artist) async{
    List<Map> query = await _database.query("songs",
        columns: Song.Columns, where: "artist='$artist'");
    List<Song> songs = List();
    query.forEach((s){
      Song song = Song.fromMap(s);
      songs.add(song);
    });
    return songs;
  }

  //TODO: Documentation required
  Future<List<Song>> fetchSongsByGenre(String genre) async{
    List<Map> query = await _database.query("songs",
        columns: Song.Columns, where: "genre='$genre'");
    List<Song> songs = List();
    query.forEach((s){
      Song song = Song.fromMap(s);
      songs.add(song);
    });
    return songs;
  }

   //TODO: Documentation required
  Future<List<Song>> fetchTopSong() async{
    List<Map> query = await _database.query("select * from songs order by count desc limit 25");
    List<Song> songs = List();
    query.forEach((s){
      Song song = Song.fromMap(s);
      songs.add(song);
    });
    return songs;
  }


  //TODO: Documentation required
  Future<int> updateSong(Song song) async{
    int id = 0;
    var query =  Sqflite.firstIntValue(await _database
    .rawQuery("SELECT COUNT FROM songs WHERE id = ?", [song.id]));

    if(song.count == null){
      song.count = 0;
    }
    song.count += 1;
    await _database.update("songs", song.toMap(),where: "id= ?", whereArgs: [song.id]);

    return id;
  }
  
  
  //TODO: Documentation required
  Future<bool> isfav(Song song) async {
    var query = Sqflite.firstIntValue(await _database
    .rawQuery("select isFav from songs where is=${song.id}"));
    if(query == 0){
      return true;
    }
    else{
      return false;
    }
  }

   //TODO: Documentation required
   Future<String> favouriteSong(Song song) async{
     await _database.rawQuery("update songs set isFav =1 where id=${song.id}");
    return "added";
    }

    //TODO: Documentation required
     Future<Song> fetchLastSong() async{
      List<Map> query = await _database.rawQuery("select * from songs order by timestamp desc limit 1");
      Song song;
      query.forEach((s){
        song = Song.fromMap(s);
      });
      return song;
     }


     Future<List<Song>> fetchLastAddedSongs() async{
      List<Map> query = await _database.rawQuery("select * from songs order by timestamp");
      Song song;
      List<Song> songs = List();
      query.forEach((s){
        song = Song.fromMap(s);
      });
      return songs;
     }



    //TODO: Documentation required
    Future<List<Song>> fetchFavouriteSong() async {
      List<Map> query = await _database.rawQuery("select * from songs where isFav=1");
      List<Song> songs = List();
      query.forEach((s){
        Song song = Song.fromMap(s);
        songs.add(song);
      });
      return songs;
    }

    //TODO: Documentation required
    Future<bool> removeFavSong(Song song) async{
      await _database.rawQuery("update songs set isFav= 0 where id=${song.id}");
      return true;
    }

    //TODO: Documentation required
    Future<List<Song>> searchSong(String searchString) async{

      List<Map> query = await _database.rawQuery("select * from songs where title like '%$searchString%'");
      List<Song> songs = List();
      query.forEach((s){
        Song song = Song.fromMap(s);
        songs.add(song);
      });
      return songs;
    }


    //TODO: Documentation required
    Future<List<Song>> fetchSongById(int id) async{

      List<Map> query = await _database.rawQuery(("select * from songs where id=$id"));
      List<Song> songs = List();
      query.forEach((s){
        Song song = Song.fromMap(s);
        songs.add(song);
      });
      return songs;
    }








                                                                   //ALBUMS QUERIES//

  //TODO: Documentation required
  Future<List<Song>> fetchAlbum() async {
    List<Map> query = await _database
    .rawQuery( "select distinct albumid,album,artist ,albumArt from songs group by album order by album");
    List<Song> songs = List();
    query.forEach((s){
      Song song = Song.fromMap(s);
      songs.add(song);
    });
    return songs;
  }


                                                                 //ARTIST QUERIES//
  //TODO: Documentation required
  Future<List<Song>> fetchArtist() async {
    List<Map> query = await _database.rawQuery("select distinct artist,album,albumArt from songs group by artist order by artist");
    List<Song> songs = List();
    query.forEach((s){
      Song song = Song.fromMap(s);
      songs.add(song);
    });
    return songs;
  }

  //TODO: Documentation required
  Future<List<Song>> fetchRandomAlbum() async {
    List<Map> query = await _database
    .rawQuery("select distinct albumid,album,artist,albumArt from songs group by album order by RANDOM() limit 10");
    List<Song> songs = List();
    query.forEach((s){
      Song song = Song.fromMap(s);
      songs.add(song);
    });
    return songs;
  }


                                                                   //RECENT SONGS QUERIES//

  //TODO: Documentation required
  Future<List<Song>> fetchRecentSongs() async{
    List<Map> query = await _database.query("select * from songs order by timestamp desc limit 25");
    List<Song> songs = List();
    query.forEach((s){
      Song song = Song.fromMap(s);
      songs.add(song);
    });
    return songs;
  }
  
  
  //TODO: Documentation required
  Future<int> insertRecentSong(Song song) async{
    int id = 0;
    var query = Sqflite.firstIntValue(await _database.
    rawQuery("SELECT COUNT(*) FROM recents WHERE id = ?", [song.id]));
    if(query == 0){
      id = await _database.insert("recents", song.toMap());
    } else {
      await _database.update("recents",song.toMap(), where: "id= ?", whereArgs: [song.id]);
   }

   return id;
  }


   //TODO: Documentation required
    Future<bool> removeRecentSong(Song song) async{
      await _database.rawDelete('DELETE FROM recents WHERE id = ?', [song.id]);
      return true;
    }

    

 

                                                                //PLAYLIST QUERIES//


//TODO: Documentation required
  Future<List<Song>> fetchPlaylistSongsByPlaylistName(String playlistTitle) async{
     List<Map> query = await _database.rawQuery(("select * from playlist where playlistTitle=$playlistTitle"));
      List<Song> songs = List();
      query.forEach((s){
        Song song = Song.fromMap(s);
        songs.add(song);
      });
      return songs;
  }
  
  
  //TODO: Documentation required
  Future<int> inserPlaylistSong(Song song, String playlistTitle) async{
    int id = 0;
    if(!song.playlistTitile){
      song.playlistTitle = playlistTitle;
    }
    
    var query = Sqflite.firstIntValue(await _database.
    rawQuery("SELECT COUNT(*) FROM playlist WHERE id = ?", [song.id]));
    if(query == 0){
      id = await _database.insert("playlist", song.toMap());
    } else {
      await _database.update("playlist",song.toMap(), where: "id= ?", whereArgs: [song.id]);
   }

   return id;
  }


   //TODO: Documentation required
    Future<bool> removePlaylistSong(Song song) async{
      await _database.rawDelete('DELETE FROM playlist WHERE id = ?', [song.id]);
      return true;
    }

    







     









  


  


  


  


  


}