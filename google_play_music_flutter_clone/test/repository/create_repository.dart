import 'dart:async';



import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

class CreateRepository {
  SqlDbClient sqlDbClient;

  Future createDatabase() async {
    return sqlDbClient.createDatabase();
  }
  
}