import 'package:google_play_music_flutter_clone/utils/flute_music_player.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/models/playlist_model.dart';
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
    PlayListDetails walking1 = PlayListDetails(1,"Walking","When I am walking");
    PlayListDetails walking2 = PlayListDetails(2,"Walking","When I am walking");
    final tPlayListDetailsList = [walking1,walking2];
    final  tSongList = [song1,song2];
    final tPlaylistTitle = 'Walking Song';
    final int tSongId = 2;
    final int tPlaylistId = 3;

  test(
      'should return a list of PlaylistDetail objects when call to fetchPlaylistDetailList is successful',
      () async{
        //arrange
        when(playlistRepositoryImpl.fetchPlaylistDetailList())
              .thenAnswer((_) async => tPlayListDetailsList);
        //act
        final result = await playlistRepositoryImpl.fetchPlaylistDetailList();

        //assert
        verify(playlistRepositoryImpl.fetchPlaylistDetailList());
          expect(result, tPlayListDetailsList);

      }
    );

    test(
      'should return a playlist id when call to insertPlaylistDetails with the right arguments is successful',
      () async{
        //arrange
        when(playlistRepositoryImpl.insertPlaylistDetails(any))
              .thenAnswer((_) async => tPlaylistId);
        //act
        final result = await playlistRepositoryImpl.insertPlaylistDetails(walking1);

        //assert
        verify(playlistRepositoryImpl.insertPlaylistDetails(walking1));
          expect(result, tPlaylistId);

      }
    );


    
     test(
      'should return a boolean variable when call to removePlayListDetails with the right arguments is successful',
      () async{
        //arrange
        when( playlistRepositoryImpl.removePlayListDetails(any))
              .thenAnswer((_) async => true);
        //act
        final result = await playlistRepositoryImpl.removePlayListDetails(walking2);

        //assert
        verify( playlistRepositoryImpl.removePlayListDetails(walking2));
          expect(result, true);

      }
    );


    test(
      'should return a list of song objects when call to fetchPlaylistSongsByPlaylistName with the right arguments is successful',
      () async{
        //arrange
        when(playlistRepositoryImpl.fetchPlaylistSongsByPlaylistName(any))
              .thenAnswer((_) async => tSongList);
        //act
        final result = await playlistRepositoryImpl.fetchPlaylistSongsByPlaylistName(tPlaylistTitle);

        //assert
        verify(playlistRepositoryImpl.fetchPlaylistSongsByPlaylistName(tPlaylistTitle));
          expect(result, tSongList);

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


