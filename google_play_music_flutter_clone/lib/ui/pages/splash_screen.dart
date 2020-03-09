import 'package:flutter/material.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/create_repository.dart';
import 'package:google_play_music_flutter_clone/repository/songs_repository.dart';
import 'package:google_play_music_flutter_clone/ui/pages/homepage.dart';
import 'package:google_play_music_flutter_clone/utils/flute_music_player.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
    loadingSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("4")
              // Image.asset('images/MINIMIE CHINCHIN PROMO 1.jpg'),
            ],
          ),
        ),),
    );
  }
}


loadingSongs() async {
  final _createrepository  = SqlDbClientImpl();
  //  final _songsrepository  = SongRepositoryImpl(sqlDbClient: sqlDbClient);
  await _createrepository.createDatabase();
  if(await _createrepository.isAlreadyLoaded()){
    print('Sons are loaded');
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder:(context)=> HomePage()));
  }
  else{
    var all_songs;

    try{
      all_songs = await MusicFinder.allSongs();
      List<Song> list = List.from(all_songs);

      if(list == null || list.length == 0){
        print("List-> $list");

        print("No music Found");
      }else{
        for(Song song in list){
          _createrepository.insertSong(song);
        }
        print('Song are loaded');
      }
    } catch (e) {
        print("failed to get songs");
      }
    }

  }

