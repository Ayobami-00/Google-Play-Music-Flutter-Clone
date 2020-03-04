import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/playlist_repository.dart';
import 'package:mockito/mockito.dart';


class MockSqlDbClient extends Mock implements SqlDbClient{}
 


void main(){

  PlaylistRepositoryImpl playlistRepositoryImpl;
  MockSqlDbClient mockSqlDbClient;



  setUp(() {
  mockSqlDbClient = MockSqlDbClient();
  playlistRepositoryImpl = PlaylistRepositoryImpl(sqlDbClient: mockSqlDbClient);
});



  group('Playlist Queries', (){
    Song song1 = Song(1,'Brymo','Love Me','X',1,230,"uri/uri","albumArt/albumrt",'pop');
    Song song2 = Song(2,'Fela','Hate Me','NO WONDER',2,300,"uri/uri","albumArt/albumrt",'Afro pop');
    final  ttSongList = [song1,song2];
    final tPlaylistTitle = 'Walking Song';
    final int tSongId = 2;

    test(
      'should return a list of song objects when call to fetchPlaylistSongsByPlaylistName with the right arguments is successful',
      () async{
        //arrange
        when(playlistRepositoryImpl.fetchPlaylistSongsByPlaylistName(any))
              .thenAnswer((_) async => ttSongList);
        //act
        final result = await playlistRepositoryImpl.fetchPlaylistSongsByPlaylistName(tPlaylistTitle);

        //assert
        verify(playlistRepositoryImpl.fetchPlaylistSongsByPlaylistName(tPlaylistTitle));
          expect(result, ttSongList);

      }
    );

    



    test(
      'should return a song id when call to insertPlaylistSong with the right arguments is successful',
      () async{
        //arrange
        when(playlistRepositoryImpl.insertPlaylistSong(any,any))
              .thenAnswer((_) async => tSongId);
        //act
        final result = await playlistRepositoryImpl.insertPlaylistSong(song1,tPlaylistTitle);

        //assert
        verify(playlistRepositoryImpl.insertPlaylistSong(song1,tPlaylistTitle));
          expect(result, tSongId);

      }
    );


     test(
      'should return a boolean variable when call to removePlaylistSong with the right arguments is successful',
      () async{
        //arrange
        when( playlistRepositoryImpl.removePlaylistSong(any))
              .thenAnswer((_) async => true);
        //act
        final result = await playlistRepositoryImpl.removePlaylistSong(song1);

        //assert
        verify( playlistRepositoryImpl.removePlaylistSong(song1));
          expect(result, true);

      }
    );



  });
}


