import 'package:flutter/material.dart';
import 'package:party/api_service.dart';
import '../models/party.dart';
import '../models/song.dart';
import 'nominate_song_screen.dart';
import 'song_management.dart';
import 'timer_management.dart';
import 'party_screen_ui.dart';

class PartyScreen extends StatefulWidget {
  final Party party;

  const PartyScreen({super.key, required this.party});

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

  bool isLoading = false;

  void updateSearchQuery(String newQuery) async {
    setState(() {
      isLoading = true;
    });

    searchQuery = newQuery;
    searchResults = await songManagement.searchSongs(newQuery);

    setState(() {
      isLoading = false;
    });
  }

  void nominateSong(Song song) {
    songManagement.nominateSong(song);
  }

  void voteForSong(Song song) {
    songManagement.voteForSong(song);
  }

  @override
  Widget build(BuildContext context) {
    return timerManagement.isNominationPeriod
        ? NominateSongScreen(
            searchResults: searchResults, nominateSong: nominateSong)
        : PartyScreenUI(
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
