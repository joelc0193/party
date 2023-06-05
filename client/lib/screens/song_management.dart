import '../models/song.dart';
import '../deezer_api.dart';

class SongManagement {
  final DeezerApi deezerApi = DeezerApi(
    clientId: 'your_client_id',
    clientSecret: 'your_client_secret',
    redirectUri: 'your_redirect_uri',
  );
  List<Song> songs = [
    Song(id: '1', title: 'Song 1', artist: 'Artist 1'),
    Song(id: '2', title: 'Song 2', artist: 'Artist 2'),
    // Add more songs here...
  ];

  Future<List<Song>> searchSongs(String query) async {
    return await deezerApi.searchSongs(query);
  }

  void nominateSong(Song song) {
    song.nominated = true;
  }

  void voteForSong(Song song) {
    song.votes++;
  }
}
