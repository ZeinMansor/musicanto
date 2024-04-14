import 'package:musicanto/models/song.dart';

class PlayList {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  PlayList({required this.title, required this.songs, required this.imageUrl});
}
