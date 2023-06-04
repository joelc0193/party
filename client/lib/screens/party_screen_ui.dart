import 'package:flutter/material.dart';
import '../models/party.dart';
import '../models/song.dart';
import 'song_management.dart';
import 'timer_management.dart';

class PartyScreenUI extends StatefulWidget {
  final Party party;
  final SongManagement songManagement;
  final TimerManagement timerManagement;
  final Function(String) updateSearchQuery;
  final Function(Song) nominateSong;
  final Function(Song) voteForSong;
  final List<Song> searchResults;
  final Duration elapsedTime;
  final Duration songDuration;

  PartyScreenUI({
    required this.party,
    required this.songManagement,
    required this.timerManagement,
    required this.updateSearchQuery,
    required this.nominateSong,
    required this.voteForSong,
    required this.searchResults,
    required this.elapsedTime,
    required this.songDuration,
  });

  @override
  State<PartyScreenUI> createState() => _PartyScreenUIState();
}

class _PartyScreenUIState extends State<PartyScreenUI> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.party.name),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: widget.updateSearchQuery,
            decoration: InputDecoration(
              labelText: 'Search for songs',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.searchResults[index].title),
                  subtitle: Text(widget.searchResults[index].artist),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text('Nominate'),
                        onPressed: () {
                          if (widget.elapsedTime.inSeconds >=
                                  (widget.songDuration.inSeconds / 2) &&
                              widget.elapsedTime.inSeconds <
                                  (widget.songDuration.inSeconds * 3 / 4)) {
                            widget.nominateSong(widget.searchResults[index]);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Nominations are closed.'),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        child: Text('Vote'),
                        onPressed: () {
                          if (widget.elapsedTime.inSeconds >=
                              (widget.songDuration.inSeconds * 3 / 4)) {
                            widget.voteForSong(widget.searchResults[index]);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Voting has not started yet.'),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}