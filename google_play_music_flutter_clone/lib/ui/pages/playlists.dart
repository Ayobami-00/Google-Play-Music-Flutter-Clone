import 'package:flutter/material.dart';
import 'package:google_play_music_flutter_clone/ui/views/card_view.dart';
import 'package:flute_music_player/flute_music_player.dart';

class PlaylistsPage extends StatefulWidget {
  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  var songs = MusicFinder.allSongs();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("3")
        // Container(
        //   child: Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: GridView.builder(
        //       itemCount: 2,
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2, crossAxisSpacing: 6.0, mainAxisSpacing: 4.0),
        //       itemBuilder: (BuildContext context, int index) {
        //         return CardView();
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
