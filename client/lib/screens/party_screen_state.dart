import 'package:flutter/material.dart';
import 'package:party/screens/party_screen.dart';
import 'package:party/screens/song_management.dart';
import 'package:party/screens/timer_management.dart';

import '../models/song.dart';
import 'party_screen_ui.dart';

class _PartyScreenState extends State<PartyScreen> {
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
