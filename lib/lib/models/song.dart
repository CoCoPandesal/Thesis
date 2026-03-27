class Song {
  final String title;
  final String artist;
  final String image;
  final String? date;

  const Song({
    required this.title,
    required this.artist,
    required this.image,
    this.date,
  });
}
