import 'package:flutter/material.dart';

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child:
                        Icon(Icons.music_note, color: Colors.white, size: 15.0),
                  ),
                )),
            title: Text('Into the Unknown'),
            subtitle: Text('Aurora'),
            trailing: Icon(
              Icons.pause,
              size: 50.0,
              color: Colors.black,
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 580.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.music_note,
                      color: Colors.white.withOpacity(0.6), size: 250.0),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Slider(
                    activeColor: Colors.deepOrange,
                    inactiveColor: Colors.red,
                    min: 0.0,
                    value: 0.5,
                    max: 1.0,
                    onChanged: (double newValue) {},
                    divisions: 100,
                  ),
                  
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
