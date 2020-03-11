import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/artist_repository.dart';
import 'package:mockito/mockito.dart';


class MockSqlDbClient extends Mock implements SqlDbClient{}
 


void main(){

  ArtistRepositoryImpl artistRepositoryImpl;
  MockSqlDbClient mockSqlDbClient;



  setUp(() {
  mockSqlDbClient = MockSqlDbClient();
  artistRepositoryImpl = ArtistRepositoryImpl(sqlDbClient: mockSqlDbClient);
});



  group('Artisit Queries', (){

    Song song1 = Song(1,'Brymo','Love Me','X',1,230,"uri/uri","albumArt/albumrt",'pop');
    Song song2 = Song(2,'Fela','Hate Me','NO WONDER',2,300,"uri/uri","albumArt/albumrt",'Afro pop');
    final  tSongList = [song1,song2];

    test(
      'should return a list of song objects when call to fetchArtists is successful',
      () async{
        //arrange
        when(artistRepositoryImpl.fetchArtists())
              .thenAnswer((_) async => tSongList );
        //act
        final result = await artistRepositoryImpl.fetchArtists();

        //assert
        verify(artistRepositoryImpl.fetchArtists());
          expect(result, equals(tSongList));

      }
    );
  });
}


