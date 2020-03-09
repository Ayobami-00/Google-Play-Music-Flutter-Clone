import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
              child: Container(
                child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                children: <Widget>[
                  Image.network("https://placeimg.com/500/500/any",fit:BoxFit.fill),
                  Image.network("https://placeimg.com/400/500/any",fit:BoxFit.fill),
                  Image.network("https://placeimg.com/300/500/any",fit:BoxFit.fill),
                  Image.network("https://placeimg.com/200/500/any",fit:BoxFit.fill),
                ],
          ),
              ),
            
        footer: Container(
          height: 0.0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Walking"),
              ),
              Text("two"),
            ],
          ),
        ),
      );
  }
}