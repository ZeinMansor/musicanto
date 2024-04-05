import 'package:musicanto/models/artist.dart';

class Song {
  final String name;
  final Artist artist;
  // final String type;
  // final double price;
  final String thumbnailUrl;

  Song(this.name, this.artist, this.thumbnailUrl);
}
