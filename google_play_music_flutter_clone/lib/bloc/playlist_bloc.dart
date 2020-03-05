import 'dart:async';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:google_play_music_flutter_clone/bloc/bloc_provider.dart';
import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/models/playlist_model.dart';
import 'package:google_play_music_flutter_clone/repository/playlist_repository.dart';
import 'package:google_play_music_flutter_clone/utils/song_and_playlist_name.dart';
import 'package:google_play_music_flutter_clone/utils/title_and_songs.dart';


class PlayListBloc implements BlocBase{

  static SqlDbClient sqlDbClient;
  final _repository  = PlaylistRepositoryImpl(sqlDbClient: sqlDbClient);
  final _addPlaylistDetailsController = StreamController<PlayListDetails>.broadcast();
  final _removePlaylistDetailsController = StreamController<PlayListDetails>.broadcast();
  final _addSongToPlaylistController = StreamController<SongAndPlayListName>.broadcast();
  final _removeSongFromPlaylistController = StreamController<SongAndPlayListName>.broadcast();
  final _playlistDetailsListController = StreamController<List<PlayListDetails>>.broadcast();
  final _playListNamesController = StreamController<String>.broadcast();
  final _playListSongsByPlayListNamesController = StreamController<SongListAndPlayListName>.broadcast();
  
  StreamSink<PlayListDetails> get addPlaylistDetail => _addPlaylistDetailsController.sink;
  StreamSink<PlayListDetails> get removePlaylistDetail => _removePlaylistDetailsController.sink;
  StreamSink<List<PlayListDetails>> get addPlaylistDetailList => _playlistDetailsListController.sink;
  StreamSink<String> get addPlayListNameToGetSongList => _playListNamesController.sink;
  StreamController<SongListAndPlayListName> get addListOfSongsByPlayListNames => _playListSongsByPlayListNamesController.sink;

 
 PlayListBloc(){
   _addPlaylistDetailsController.stream.listen(handleAddPlaylistDetail);
   _removePlaylistDetailsController.stream.listen(handleRemovePlaylistDetail);
    _addSongToPlaylistController.stream.listen(handleAddSongToPlaylist);
   _removeSongFromPlaylistController.stream.listen(handleRemoveSongFromPlaylist);
   _playlistDetailsListController.stream.listen(handleAddPlayListDetails);
   _playListNamesController.stream.listen(handleAddPlayListNameToGetSongList);
 }

 void handleAddPlaylistDetail(PlayListDetails playListDetails) async {
   await _repository.insertPlaylistDetails(playListDetails);
 }

 void handleRemovePlaylistDetail(PlayListDetails playListDetails) async{
   await _repository.insertPlaylistDetails(playListDetails);
 }

void handleAddSongToPlaylist(SongAndPlayListName songAndPlayListName) async{
  await _repository.insertPlaylistSong(songAndPlayListName.song, songAndPlayListName.playlistTitle);
 }

 void handleRemoveSongFromPlaylist(SongAndPlayListName songAndPlayListName) async{
    await _repository.removePlaylistSong(songAndPlayListName.song);
 }

 void getPlayListDetailsList() async{
   List<PlayListDetails> playListDetailsList = await _repository.fetchPlaylistDetailList();
   addPlaylistDetailList.add(playListDetailsList);

 }

 void handleAddPlayListDetails(List<PlayListDetails> list) async{
   list.forEach((playListDetail){
     addPlayListNameToGetSongList.add(playListDetail.playlistName);
   });
 }

 void handleAddPlayListNameToGetSongList(String playlistTitle) async{
   List<Song> songsListbyPlaylist = await _repository.fetchPlaylistSongsByPlaylistName(playlistTitle);
   SongListAndPlayListName songListAndPlayListName = SongListAndPlayListName(); 
   songListAndPlayListName.playlistTitle = playlistTitle;
   songListAndPlayListName.songList = songsListbyPlaylist;
   addListOfSongsByPlayListNames.add(songListAndPlayListName);


 }
 
 




  @override
  void dispose() {
    _addPlaylistDetailsController.close();
    _removePlaylistDetailsController.close();
    _addSongToPlaylistController.close();
    _removeSongFromPlaylistController.close();
    _playlistDetailsListController.close();
    _playListNamesController.close();
    _playListSongsByPlayListNamesController.close();
    
  }

}