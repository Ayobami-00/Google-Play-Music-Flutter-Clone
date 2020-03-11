import 'dart:io';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_play_music_flutter_clone/bloc/albums_bloc.dart/bloc/albums_bloc.dart';
import 'package:google_play_music_flutter_clone/ui/views/loading.dart';

class AlbumsPage extends StatefulWidget {
  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
    BlocProvider.of<AlbumsBloc>(context).add(LoadAlbums());
  }

  dynamic getImage(Song song) {
    return song.albumArt == null
        ? null
        : new File.fromUri(Uri.parse(song.albumArt));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AlbumsBloc, AlbumsState>(
      listener: (context, state) {},
      child: BlocBuilder<AlbumsBloc, AlbumsState>(
        builder: (context, state) {
          if (state is AlbumsInitial) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Loading(),
            );
          } else if (state is NoAlbumsAvailable) {
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
          } else if (state is AlbumsLoaded) {
            List<Song> albums = state.allAlbumsList;
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: albums.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: getImage(albums[index]) != null
                          ? Image(
                              image: FileImage(getImage(albums[index])),
                            )
                          : Container(
                              color: Colors.grey.withOpacity(0.2),
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.music_note,
                                      color: Colors.white, size: 40.0),
                                ),
                              ),
                            ),
                      footer: Container(
                        height: 30.0,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  albums[index].album,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ),
                    );
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
