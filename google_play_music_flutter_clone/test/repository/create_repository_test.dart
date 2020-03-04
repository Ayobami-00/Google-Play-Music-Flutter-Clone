import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/create_repository.dart';
import 'package:mockito/mockito.dart';


class MockSqlDbClient extends Mock implements SqlDbClient{}
 


void main(){

  CreateRepositoryImpl createRepositoryImpl;
  MockSqlDbClient mockSqlDbClient;



  setUp(() {
  mockSqlDbClient = MockSqlDbClient();
  createRepositoryImpl = CreateRepositoryImpl(sqlDbClient: mockSqlDbClient);
});



  group('Creating the Repositories', (){
    test(
      'should return a list of song objects when call to fetchArtists is successful',
      () async{
        //arrange
        when(createRepositoryImpl.createDatabase())
              .thenAnswer((_) async => null );
        //act
        final result = await createRepositoryImpl.createDatabase();

        //assert
        verify(createRepositoryImpl.createDatabase());
          expect(result, equals(null));

      }
    );
  });
}


