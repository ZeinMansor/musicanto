import 'package:musicanto/models/artist.dart';

class Song {
  final String name;
  final Artist artist;
  final String type;
  final double price;
  final String thumbnailUrl;
  final String url;

  Song(this.name, this.artist, this.type, this.price, this.thumbnailUrl,
      this.url);

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        json['name'] as String,
        Artist.fromJson(json['artist']
            as Map<String, dynamic>), // Assuming artist data exists
        json['type'] as String,
        json['price']?.toDouble() ?? 0.0, // Handle null price gracefully
        json['thumbnailUrl'] as String,
        json['url'] as String,
      );

  static List<Song> songs = [
    Song("Song Name 1", Artist(0, "Artists one", "last name", "m", "syr"),
        "Classic", 220.0, "assets/images/1.jpg", "assets/music/music_01.mp3"),
    Song("Song Name 2", Artist(0, "Artists tow", "last name", "m", "syr"),
        "Rock", 120.0, "assets/images/2.jpg", "assets/music/music_01.mp3"),
    Song("Song Name 3", Artist(0, "Artists tow", "last name", "m", "syr"),
        "Rock", 120.0, "assets/images/3.jpg", "assets/music/music_01.mp3"),
    Song("Song Name 4", Artist(0, "Artists tow", "last name", "m", "syr"),
        "Rock", 120.0, "assets/images/4.jpg", "assets/music/music_01.mp3"),
    Song("Song Name 5", Artist(0, "Artists tow", "last name", "m", "syr"),
        "Rock", 120.0, "assets/images/5.jpg", "assets/music/music_01.mp3"),
    Song("Song Name 6", Artist(0, "Artists tow", "last name", "m", "syr"),
        "Rock", 120.0, "assets/images/6.jpg", "assets/music/music_01.mp3"),
  ];
}
