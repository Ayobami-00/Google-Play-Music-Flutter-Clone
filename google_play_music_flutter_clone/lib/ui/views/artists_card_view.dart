import 'dart:io';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

class ArtistsCardView extends StatefulWidget {
  final List<Song> albums;
  final int index;

  const ArtistsCardView({Key key, this.albums, this.index}) : super(key: key);
  @override
  _ArtistsCardViewState createState() => _ArtistsCardViewState();
}

class _ArtistsCardViewState extends State<ArtistsCardView> {

   dynamic getImage(Song song) {
    return song.albumArt == null
        ? null
        : new File.fromUri(Uri.parse(song.albumArt));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        getImage(widget.albums[widget.index]) != null
            ? Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image(
                        image: FileImage(getImage(widget.albums[widget.index])),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        right: 100.0,
                        left: 120.0,
                        top: 15.0,
                        child: Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.play_circle_filled,
                              color: Colors.white, size: 35.0),
                        ))
                  ],
                ),
              )
            : Expanded(
                child: Container(
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
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        widget.albums[widget.index].artist,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
      ],
    ));
  }
}