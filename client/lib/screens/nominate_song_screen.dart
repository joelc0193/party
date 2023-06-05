import 'package:flutter/material.dart';
import '../models/song.dart';

class NominateSongScreen extends StatefulWidget {
  final List<Song> searchResults;
  final Function nominateSong;

  const NominateSongScreen({super.key, required this.searchResults, required this.nominateSong});

  @override
  _NominateSongScreenState createState() => _NominateSongScreenState();
}

class _NominateSongScreenState extends State<NominateSongScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nominate a Song'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.searchResults[index].title),
                  subtitle: Text(widget.searchResults[index].artist),
                  trailing: ElevatedButton(
                    child: const Text('Nominate'),
                    onPressed: () {
                      widget.nominateSong(widget.searchResults[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
