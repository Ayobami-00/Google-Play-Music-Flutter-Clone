import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/splash_screen_bloc/bloc/splash_screen_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/playlist_bloc/bloc/playlist_bloc.dart';
import 'package:google_play_music_flutter_clone/ui/views/loading.dart';
import 'package:google_play_music_flutter_clone/ui/pages/homepage.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Image logo;
  @override
  void initState() {
    super.initState();
    logo =
        Image.asset('images/kindpng_757028.png', width: 150.0, height: 150.0);
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
    precacheImage(logo.image, context);
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
                return BlocProvider(
                  create: (context) => PlaylistBloc(),
                  child: HomePage());
              }));
            }
          },
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            builder: (context, state) {
              if (state is DatabaseLoading) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Loading(),
                );
              } else if (state is DatabaseLoaded) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: logo,
                      ),
                      Text(state.message,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepOrange.withOpacity(0.4),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
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
              } else {
                return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
