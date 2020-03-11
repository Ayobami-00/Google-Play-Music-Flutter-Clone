import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/recent_songs_repository.dart';
import 'package:mockito/mockito.dart';


class MockSqlDbClient extends Mock implements SqlDbClient{}
 


void main(){

  RecentSongsRepositoryImpl recentSongsRepositoryImpl;
  MockSqlDbClient mockSqlDbClient;



  setUp(() {
  mockSqlDbClient = MockSqlDbClient();
  recentSongsRepositoryImpl = RecentSongsRepositoryImpl(sqlDbClient: mockSqlDbClient);
});



  group('Recent Songs Queries', (){
    Song song1 = Song(1,'Brymo','Love Me','X',1,230,"uri/uri","albumArt/albumrt",'pop');
    Song song2 = Song(2,'Fela','Hate Me','NO WONDER',2,300,"uri/uri","albumArt/albumrt",'Afro pop');
    final  ttSongList = [song1,song2];
    final int tSongId = 2;

    test(
      'should return a list of song objects when call to fetchRecentSongs with the right arguments is successful',
      () async{
        //arrange
        when(recentSongsRepositoryImpl.fetchRecentSongs())
              .thenAnswer((_) async => ttSongList);
        //act
        final result = await recentSongsRepositoryImpl.fetchRecentSongs();

        //assert
        verify(recentSongsRepositoryImpl.fetchRecentSongs());
          expect(result, ttSongList);

      }
    );

    



    test(
      'should return a song id when call to insertRecentSong with the right arguments is successful',
      () async{
        //arrange
        when(recentSongsRepositoryImpl.insertRecentSong(any))
              .thenAnswer((_) async => tSongId);
        //act
        final result = await recentSongsRepositoryImpl.insertRecentSong(song1);

        //assert
        verify(recentSongsRepositoryImpl.insertRecentSong(song1));
          expect(result, tSongId);

      }
    );


     test(
      'should return a boolean variable when call to removeRecentSong with the right arguments is successful',
      () async{
        //arrange
        when(recentSongsRepositoryImpl.removeRecentSong(any))
              .thenAnswer((_) async => true);
        //act
        final result = await recentSongsRepositoryImpl.removeRecentSong(song1);

        //assert
        verify(recentSongsRepositoryImpl.removeRecentSong(song1));
          expect(result, true);

      }
    );



  });
}


