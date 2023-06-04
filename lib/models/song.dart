class Song {
  final String id;
  final String title;
  final String artist;
  int votes;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    this.votes = 0,
  });
}