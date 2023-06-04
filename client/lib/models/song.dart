class Song {
  final String id;
  final String title;
  final String artist;
  bool nominated;
  int votes;

  Song({required this.id, required this.title, required this.artist, this.nominated = false, this.votes = 0});
}
