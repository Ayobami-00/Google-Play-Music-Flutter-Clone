import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/artists_bloc/bloc/artists_bloc.dart';
import 'package:google_play_music_flutter_clone/ui/pages/artist.dart';
import 'package:google_play_music_flutter_clone/ui/pages/playlists.dart';
import 'package:google_play_music_flutter_clone/ui/views/now_playing.dart';
import 'package:google_play_music_flutter_clone/ui/pages/songs.dart';
import 'package:google_play_music_flutter_clone/ui/pages/albums.dart';
import 'package:google_play_music_flutter_clone/bloc/songs_bloc/bloc/songs_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/albums_bloc.dart/bloc/albums_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                backgroundColor: Colors.deepOrange,
                title: Text("Music Library"),
                pinned: false,
                expandedHeight: 120.0,
                bottom: new TabBar(
                  isScrollable: true,
                  tabs: [
                    new Tab(text: 'PLAYLIST'),
                    new Tab(text: 'ARTISTS'),
                    new Tab(text: 'ALBUMS'),
                    new Tab(text: 'SONGS'),
                    new Tab(text: 'GENRES'),
                  ],
                  controller: controller,
                ),
              ),
              new SliverFillRemaining(
                child: TabBarView(
                  controller: controller,
                  children: <Widget>[
                    PlaylistsPage(),
                    BlocProvider(
                    create: (context) => ArtistsBloc(),
                    child: ArtistsPage()),
                    BlocProvider(
                    create: (context) => AlbumsBloc(),
                    child: AlbumsPage()),
                    BlocProvider(
                    create: (context) => SongsBloc(),
                    child: SongsPage()),
                    Text("Tab 3"),
                  ],
                ),
              ),
            ],
          ),
          SlidingUpPanel(
            maxHeight: MediaQuery.of(context).size.height - 31,
            minHeight: 70.0,
            panel: Center(
              child: NowPlaying(),
            ),
          )
        ],
      ),
    );
  }
}
