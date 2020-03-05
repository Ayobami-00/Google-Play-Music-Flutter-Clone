import 'dart:math';

class PlayListDetails {
  int id;
  String playlistName;
  String description;

  var pid = Random().nextInt(10);


  PlayListDetails(this.id, this.playlistName, this.description);
  PlayListDetails.fromMap(Map m) {
    id = m["id"];
    playlistName = m["playlistName"];
    description = m["description"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": pid,
      "playlistName": playlistName,
      "description": description,
    };
  }

}


