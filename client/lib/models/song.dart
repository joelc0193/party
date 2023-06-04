class Song {
  final String id;
  final String title;
  final String artist;
  bool nominated;

  Song({required this.id, required this.title, required this.artist, this.nominated = false});
}
