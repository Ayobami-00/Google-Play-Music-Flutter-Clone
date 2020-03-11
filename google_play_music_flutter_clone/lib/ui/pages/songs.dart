import 'dart:io';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/songs_bloc/bloc/songs_bloc.dart';
import 'package:google_play_music_flutter_clone/ui/views/loading.dart';

class SongsPage extends StatefulWidget {
  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
    BlocProvider.of<SongsBloc>(context).add(LoadSongs());
  }

  dynamic getImage(Song song) {
    return song.albumArt == null
        ? null
        : new File.fromUri(Uri.parse(song.albumArt));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SongsBloc, SongsState>(
      listener: (context, state) {},
      child: BlocBuilder<SongsBloc, SongsState>(
        builder: (context, state) {
          if (state is SongsInitial) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Loading(),
            );
          } else if (state is NoSongsAvailable) {
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
          } else if (state is SongsLoaded) {
            List<Song> songs = state.allSongsList;
            return Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Container(
                            width: 50.0,
                            height: 50.0,
                            color: Colors.grey.withOpacity(0.2),
                            child: getImage(songs[index]) != null
                                ? Image(
                                    image: FileImage(getImage(songs[index])))
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 5.0,
                                      height: 5.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.music_note,
                                          color: Colors.white, size: 15.0),
                                    ),
                                  )),
                        trailing: Icon(Icons.more_vert),
                        title: Text(songs[index].title,
                            maxLines: 1, style: TextStyle(fontSize: 18.0)),
                        subtitle: Text(
                          songs[index].artist, 
                          // + Duration(milliseconds: songs[index].duration)
                          //   .toString()
                          //   .split(':')
                          //   .first,
                          maxLines: 1,
                          style:
                              new TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      );
                    }),
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
