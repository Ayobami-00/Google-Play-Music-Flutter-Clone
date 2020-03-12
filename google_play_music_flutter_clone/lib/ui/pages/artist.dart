import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/artists_bloc/bloc/artists_bloc.dart';
import 'package:google_play_music_flutter_clone/ui/pages/artists_detail_page.dart';
import 'package:google_play_music_flutter_clone/ui/views/artists_card_view.dart';
import 'package:google_play_music_flutter_clone/ui/views/card_view.dart';
import 'package:google_play_music_flutter_clone/ui/views/loading.dart';

class ArtistsPage extends StatefulWidget {
  @override
  _ArtistsPageState createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
    BlocProvider.of<ArtistsBloc>(context).add(LoadArtists());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArtistsBloc, ArtistsState>(
      listener: (context, state) {},
      child: BlocBuilder<ArtistsBloc, ArtistsState>(
        builder: (context, state) {
          if (state is ArtistsInitial) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Loading(),
            );
          } else if (state is NoArtistsAvailable) {
            return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: Text(
                  state.message,
                  style: TextStyle(
                      color: Colors.deepOrange.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                )));
          } else if (state is ArtistsLoaded) {
            List<Song> artists = state.allArtistsList;
            return Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 75.0),
                child: GridView.builder(
                  itemCount: artists.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                      childAspectRatio: 1.3),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => ArtistsDetailPage(albums: artists, index: index)));
                        },
                        child: ArtistsCardView(albums: artists, index: index));
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
