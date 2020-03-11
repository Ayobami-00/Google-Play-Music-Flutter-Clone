import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/songs_repository.dart';
import 'package:mockito/mockito.dart';


class MockSqlDbClient extends Mock implements SqlDbClient{}
 


void main(){

  SongRepositoryImpl songRepositoryImpl;
  MockSqlDbClient mockSqlDbClient;



  setUp(() {
  mockSqlDbClient = MockSqlDbClient();
  songRepositoryImpl = SongRepositoryImpl(sqlDbClient: mockSqlDbClient);
});



  group('Songs Queries', (){
    Song song1 = Song(1,'Brymo','Love Me','X',1,230,"uri/uri","albumArt/albumrt",'pop');
    Song song2 = Song(2,'Fela','Hate Me','NO WONDER',2,300,"uri/uri","albumArt/albumrt",'Afro pop');
    final  tSongList = [song1,song2];
    final int tSongId = 2;
    final tArtist = 'Jon Bellion';
    final tGenre = 'Funk';


    test(
      'should return a song id when call to insertSongToDatabase with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.insertSongToDatabase(any))
              .thenAnswer((_) async => tSongId);
        //act
        final result = await songRepositoryImpl.insertSongToDatabase(song1);

        //assert
        verify(songRepositoryImpl.insertSongToDatabase(song1));
          expect(result, tSongId);

      }
    );



    test(
      'should return a song id when call to updateSongListInDatabase with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.updateSongListInDatabase(any))
              .thenAnswer((_) async => tSongId);
        //act
        final result = await songRepositoryImpl.updateSongListInDatabase(song1);

        //assert
        verify(songRepositoryImpl.updateSongListInDatabase(song1));
          expect(result, tSongId);

      }
    );


     test(
      'should return a boolean variable when call to checkIfSongsAreLoaded with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.checkIfSongsAreLoaded())
              .thenAnswer((_) async => true);
        //act
        final result = await songRepositoryImpl.checkIfSongsAreLoaded();

        //assert
        verify(songRepositoryImpl.checkIfSongsAreLoaded());
          expect(result, true);

      }
    );




    test(
      'should return a list of song objects when call to fetchAllSongs is successful',
      () async{
        //arrange
        when(songRepositoryImpl.fetchAllSongs())
              .thenAnswer((_) async => tSongList);
        //act
        final result = await songRepositoryImpl.fetchAllSongs();

        //assert
        verify(songRepositoryImpl.fetchAllSongs());
          expect(result, tSongList);

      }
    );


    test(
      'should return a list of song objects when call to fetchSongsByArtist with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.fetchSongsByArtist(any))
              .thenAnswer((_) async => tSongList);
        //act
        final result = await songRepositoryImpl.fetchSongsByArtist(tArtist);

        //assert
        verify(songRepositoryImpl.fetchSongsByArtist(tArtist));
          expect(result, tSongList);

      }
    );


    test(
      'should return a list of song objects when call to fetchSongsByGenre with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.fetchSongsByGenre(any))
              .thenAnswer((_) async => tSongList);
        //act
        final result = await songRepositoryImpl.fetchSongsByGenre(tGenre);

        //assert
        verify(songRepositoryImpl.fetchSongsByGenre(tGenre));
          expect(result, tSongList);

      }
    );


    test(
      'should return a list of song objects when call to fetchTopSongs is successful',
      () async{
        //arrange
        when(songRepositoryImpl.fetchTopSongs())
              .thenAnswer((_) async => tSongList);
        //act
        final result = await songRepositoryImpl.fetchTopSongs();

        //assert
        verify(songRepositoryImpl.fetchTopSongs());
          expect(result, tSongList);

      }
    );

    test(
      'should return a song id when call to updateSong with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.updateSong(any))
              .thenAnswer((_) async => tSongId);
        //act
        final result = await songRepositoryImpl.updateSong(song1);

        //assert
        verify(songRepositoryImpl.updateSong(song1));
          expect(result, tSongId);

      }
    );


    test(
      'should return a boolean variable when call to checkIfASongIsFav with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.checkIfASongIsFav(any))
              .thenAnswer((_) async => true);
        //act
        final result = await songRepositoryImpl.checkIfASongIsFav(song1);

        //assert
        verify(songRepositoryImpl.checkIfASongIsFav(song1));
          expect(result, true);

      }
    );



    test(
      'should return a boolean variable when call to makeSongFavourite with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.makeSongFavourite(any))
              .thenAnswer((_) async => " ");
        //act
        final result = await songRepositoryImpl.makeSongFavourite(song1);

        //assert
        verify(songRepositoryImpl.makeSongFavourite(song1));
          expect(result, " ");

      }
    );


    test(
      'should return a boolean variable when call to fetchLastSong is successful',
      () async{
        //arrange
        when(songRepositoryImpl.fetchLastSong())
              .thenAnswer((_) async => song1);
        //act
        final result = await songRepositoryImpl.fetchLastSong();

        //assert
        verify(songRepositoryImpl.fetchLastSong());
          expect(result, song1);

      }
    );


    test(
      'should return a song object when call to fetchLastAddedSongs is successful',
      () async{
        //arrange
        when(songRepositoryImpl.fetchLastAddedSongs())
              .thenAnswer((_) async => tSongList);
        //act
        final result = await songRepositoryImpl.fetchLastAddedSongs();

        //assert
        verify(songRepositoryImpl.fetchLastAddedSongs());
          expect(result,tSongList);

      }
    );


    
    test(
      'should return a list of song object when call to fetchFavouriteSongs is successful',
      () async{
        //arrange
        when(songRepositoryImpl.fetchFavouriteSongs())
              .thenAnswer((_) async => tSongList);
        //act
        final result = await songRepositoryImpl.fetchFavouriteSongs();

        //assert
        verify(songRepositoryImpl.fetchFavouriteSongs());
          expect(result, tSongList);

      }
    );

    test(
      'should return a boolean variable when call to removeFavSong with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.removeFavSong(song1))
              .thenAnswer((_) async => true);
        //act
        final result = await songRepositoryImpl.removeFavSong(song1);

        //assert
        verify(songRepositoryImpl.removeFavSong(song1));
          expect(result, true);

      }
    );


    test(
      'should return a boolean variable when call to fetchSongById with the right arguments is successful',
      () async{
        //arrange
        when(songRepositoryImpl.fetchSongById(tSongId))
              .thenAnswer((_) async => tSongList);
        //act
        final result = await songRepositoryImpl.fetchSongById(tSongId);

        //assert
        verify(songRepositoryImpl.fetchSongById(tSongId));
          expect(result, tSongList);

      }
    );






    



    


    


  });
}


