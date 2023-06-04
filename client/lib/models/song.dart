class Song {
  final String id;
  final String title;
  final String artist;
  bool nominated = false;
  int votes = 0;

  Song({required this.id, required this.title, required this.artist});

  // Add this method to your Song class
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'].toString(),
      title: json['title'] as String,
      artist: json['artist'].toString(),
    );
  }
}