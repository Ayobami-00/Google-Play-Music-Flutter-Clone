import 'dart:async';
import 'package:meta/meta.dart';


import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';

abstract class CreateRepository{

  Future createDatabase();
}

class CreateRepositoryImpl {
  final SqlDbClient sqlDbClient;

  CreateRepositoryImpl({@required this.sqlDbClient});

  Future createDatabase() async {
    return sqlDbClient.createDatabase();
  }
  
}