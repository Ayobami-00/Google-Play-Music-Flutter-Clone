// import 'package:flutter_test/flutter_test.dart';
// import 'package:google_play_music_flutter_clone/bloc/splash_screen_bloc/bloc/splash_screen_bloc.dart';
// import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
// import 'package:google_play_music_flutter_clone/repository/create_repository.dart';
// import 'package:google_play_music_flutter_clone/repository/songs_repository.dart';
// import 'package:mockito/mockito.dart';

// class MockCreateRepository extends Mock implements CreateRepository{}
// class MockSongsRepository extends Mock implements SongRepository{}

// class MockSqlDbClient extends Mock implements SqlDbClient{}



// void main(){

//   SplashScreenBloc splashScreenBloc;
//   CreateRepositoryImpl createRepositoryImpl;
//   SongRepositoryImpl songRepositoryImpl;
//   MockSqlDbClient mockSqlDbClient;





//   setUp(() {
//   mockSqlDbClient = MockSqlDbClient();
//   createRepositoryImpl = CreateRepositoryImpl(sqlDbClient: mockSqlDbClient);
//   songRepositoryImpl = SongRepositoryImpl(sqlDbClient: mockSqlDbClient);

//     splashScreenBloc =  SplashScreenBloc();
// });

//   test('initialState should be Empty', () {
//     // assert
//     expect(splashScreenBloc.initialState, equals(Empty()));
//   });

//   group('Create database and load songs if not already loaded',(){

//     test(
//       'should emit [DatabaseLoading, DatabaseLoading] when data is loaded successfully',
//       () async {
//         // arrange

//         when(await createRepositoryImpl.createDatabase())
//             .thenAnswer(null);
//         when(await songRepositoryImpl.checkIfSongsAreLoaded())
//             .thenAnswer(null);
//         // assert later
//         final expected = [
//           Empty(),
//           DatabaseLoading(),
//           DatabaseLoaded(),
//         ];
//         expectLater(splashScreenBloc, emitsInOrder(expected));
//         // act
//         splashScreenBloc.add(CreateDbAndLoadSongsIfNotAlreadyLoaded());
//       },
//     );
   
//   });

// }
