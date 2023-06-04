import 'package:flutter/material.dart';
import 'package:party/api_service.dart';
import '../models/party.dart';
import '../models/song.dart';
import 'song_management.dart';
import 'timer_management.dart';
import 'party_screen_ui.dart';

class PartyScreen extends StatefulWidget {
  final Party party;

  PartyScreen({required this.party});

  @override
  _PartyScreenState createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  final ApiService apiService = ApiService();
  final SongManagement songManagement = SongManagement();
  final TimerManagement timerManagement = TimerManagement();
  String searchQuery = '';
  List<Song> searchResults = [];

  @override
  void initState() {
    super.initState();
    timerManagement.startSongTimer();
  }

  @override
  void dispose() {
    timerManagement.dispose();
    super.dispose();
  }

  void updateSearchQuery(String newQuery) async {
    searchQuery = newQuery;
    searchResults = await songManagement.searchSongs(newQuery);
    setState(() {}); 
  }

  void nominateSong(Song song) {
    songManagement.nominateSong(song);
  }

  void voteForSong(Song song) {
    songManagement.voteForSong(song);
  }

  @override
  Widget build(BuildContext context) {
    return PartyScreenUI(
      party: widget.party,
      songManagement: songManagement,
      timerManagement: timerManagement,
      updateSearchQuery: updateSearchQuery,
      nominateSong: nominateSong,
      voteForSong: voteForSong,
      searchResults: searchResults,
      elapsedTime: timerManagement.elapsedTime,
      songDuration: timerManagement.songDuration,
    );
  }
}
