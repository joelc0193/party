import 'song.dart';

class Party {
  final String id;
  final String name;
  final String owner;
  final List<Song> songs;

  Party({
    required this.id,
    required this.name,
    required this.owner,
    required this.songs,
  });
}