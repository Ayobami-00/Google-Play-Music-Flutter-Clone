import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/splash_screen_bloc/bloc/splash_screen_bloc.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/create_repository.dart';
import 'package:google_play_music_flutter_clone/repository/songs_repository.dart';
import 'package:google_play_music_flutter_clone/ui/pages/homepage.dart';
import 'package:flute_music_player/flute_music_player.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
    BlocProvider.of<SplashScreenBloc>(context)
        .add(CreateDbAndLoadSongsIfNotAlreadyLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<SplashScreenBloc, SplashScreenState>(
          listener: (context, state) {
            if (state is DatabaseLoaded) {
              Navigator.of(context)
                  .pushReplacement(new MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            }
          },
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            builder: (context, state) {
              if (state is DatabaseLoading ) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image.asset('images/kindpng_757028.png',
                            width: 150.0, height: 150.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 400.0),
                        child: Text('Google Play',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey.withOpacity(0.4),
                            )),
                      ),
                    ],
                  ),
                );
              } else if (state is DatabaseLoaded) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image.asset('images/kindpng_757028.png',
                            width: 150.0, height: 150.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 400.0),
                        child: Text('Google Play',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey.withOpacity(0.4),
                            )),
                      ),
                    ],
                  ),
                );
              }
              else{
                return Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
              }
              
            },
          ),
        ),
      ),
    );
  }
}
