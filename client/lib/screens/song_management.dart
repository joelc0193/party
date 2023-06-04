import '../models/song.dart';
import 'package:party/api_service.dart';

class SongManagement {
  final ApiService apiService = ApiService();
  List<Song> songs = [
    Song(id: '1', title: 'Song 1', artist: 'Artist 1'),
    Song(id: '2', title: 'Song 2', artist: 'Artist 2'),
    // Add more songs here...
  ];

  Future<List<Song>> searchSongs(String query) async {
    return await apiService.searchSongs(query);
  }

  void nominateSong(Song song) {
    song.nominated = true;
  }

  void voteForSong(Song song) {
    song.votes++;
  }
}
