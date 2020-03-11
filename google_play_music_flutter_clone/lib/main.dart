import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/splash_screen_bloc/bloc/splash_screen_bloc.dart';
import 'package:google_play_music_flutter_clone/ui/pages/homepage.dart';
import 'package:google_play_music_flutter_clone/ui/pages/splash_screen.dart';


void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => SplashScreenBloc(),
      child: SplashScreenPage(),
    ),
    color: Colors.orange,  
  ));
}

