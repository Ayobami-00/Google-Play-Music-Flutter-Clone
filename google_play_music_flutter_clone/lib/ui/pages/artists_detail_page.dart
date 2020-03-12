import 'dart:io';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:google_play_music_flutter_clone/ui/views/artists_card_view.dart';

class ArtistsDetailPage extends StatefulWidget {
  final List<Song> albums;
  final int index;

  const ArtistsDetailPage({Key key, this.albums, this.index}) : super(key: key);
  @override
  _ArtistsDetailPageState createState() => _ArtistsDetailPageState();
}

class _ArtistsDetailPageState extends State<ArtistsDetailPage> {
  dynamic getImage(Song song) {
    return song.albumArt == null
        ? null
        : new File.fromUri(Uri.parse(song.albumArt));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              child: getImage(widget.albums[widget.index]) != null
                  ? Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Image(
                            image: FileImage(
                                getImage(widget.albums[widget.index])),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )
                  : Container(
                      color: Colors.grey.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.music_note,
                              color: Colors.white, size: 40.0),
                        ),
                      ),
                    ),
            ),
            Container(
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  widget.albums[widget.index].artist,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                ),
              ),
            ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    child: GridView.builder(
                      itemCount: widget.albums.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.5,
                          mainAxisSpacing: 1.5,
                          childAspectRatio: 1.3),
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                          child: InkWell(
                              child: ArtistsCardView(
                                  albums: widget.albums, index: widget.index)),
                        );
                      },
                    ),
                  ),
                ),
              ),
            
          ],
        ));
  }
}
