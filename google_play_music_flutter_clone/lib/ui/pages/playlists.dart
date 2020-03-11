import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_music_flutter_clone/ui/views/loading.dart';
import 'package:google_play_music_flutter_clone/ui/views/card_view.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/bloc/playlist_bloc/bloc/playlist_bloc.dart';

class PlaylistsPage extends StatefulWidget {
  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
    BlocProvider.of<PlaylistBloc>(context)
        .add(SetUpInitialPlaylistState());
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaylistBloc, PlaylistState>(
      listener: (context, state) {
        if (state is SongAddedToPlaylist) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        else if (state is SongRemovedFromPlaylist) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        else if (state is PlaylistEdited) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        else if (state is PlaylistDeleted) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: BlocBuilder<PlaylistBloc, PlaylistState>(
        builder: (context, state) {
          if (state is PlaylistInitial) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Loading(),
            );
          } else if (state is NoPlayistAvailable) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Center(child: Text(state.message, style: TextStyle(color: Colors.deepOrange.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: 30.0),))
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
