import 'package:flutter/material.dart';
import '../models/party.dart';
import '../models/song.dart';

class PartyScreen extends StatefulWidget {
  final Party party;

  PartyScreen({required this.party});

  @override
  _PartyScreenState createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  List<Song> songs = [
    Song(id: '1', title: 'Song 1', artist: 'Artist 1'),
    Song(id: '2', title: 'Song 2', artist: 'Artist 2'),
    // Add more songs here...
  ];

  List<Song> searchSongs(String query) {
    return songs.where((song) {
      return !song.nominated &&
          (song.title.toLowerCase().contains(query.toLowerCase()) ||
              song.artist.toLowerCase().contains(query.toLowerCase()));
    }).toList();
  }

  String searchQuery = '';
  List<Song> searchResults = [];

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      // TODO: Update searchResults based on the new query
    });
  }

  void nominateSong(Song song) {
    setState(() {
      song.nominated = true;
    });
  }

  void voteForSong(Song song) {
    setState(() {
      song.votes++;
    });
  }

  Timer? songTimer;
  Song? currentSong;
  Duration songDuration;
  Duration elapsedTime;

  @override
  void initState() {
    super.initState();

    // Initialize songDuration and elapsedTime
    songDuration = Duration(minutes: 3); // Assume a 3-minute song for now
    elapsedTime = Duration.zero;

    // Start the song timer
    startSongTimer();
  }

  void startSongTimer() {
    songTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime += Duration(seconds: 1);

        if (elapsedTime.inSeconds >= (songDuration.inSeconds / 2) &&
            elapsedTime.inSeconds < (songDuration.inSeconds * 3 / 4)) {
          // Open nomination period
        } else if (elapsedTime.inSeconds >= (songDuration.inSeconds * 3 / 4)) {
          // Close nomination period and open voting period
        } else if (elapsedTime >= songDuration) {
          // Close voting period and determine next song
          timer.cancel();
          determineNextSong();
        }
      });
    });
  }

  void determineNextSong() {
    // Determine the next song based on votes

    // Reset elapsedTime
    elapsedTime = Duration.zero;

    // Start the song timer again
    startSongTimer();
  }

  @override
  void dispose() {
    songTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.party.name),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: updateSearchQuery,
            decoration: InputDecoration(
              labelText: 'Search for songs',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index].title),
                  subtitle: Text(searchResults[index].artist),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text('Nominate'),
                        onPressed: () => nominateSong(searchResults[index]),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        child: Text('Vote'),
                        onPressed: () => voteForSong(searchResults[index]),
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
