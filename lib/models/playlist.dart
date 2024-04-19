import 'package:musicanto/models/song.dart';

class PlayList {
  final String title;
  final List<Song> songs;
  final String imageUrl;
  final String description;

  PlayList(
      {required this.title,
      required this.songs,
      required this.description,
      required this.imageUrl});

  static List<PlayList> playlists = [
    PlayList(
      title: "Playlist 1",
      songs: Song.songs,
      description: "Description 1",
      imageUrl: "assets/images/3.jpg",
    ),
    PlayList(
        title: "Playlist 2",
        songs: Song.songs,
        description: "Description 2",
        imageUrl: "assets/images/3.jpg"),
    PlayList(
        title: "Playlist 3",
        songs: Song.songs,
        description: "Description 3",
        imageUrl: "assets/images/3.jpg"),
    PlayList(
        title: "Playlist 4",
        songs: Song.songs,
        description: "Description 4",
        imageUrl: "assets/images/3.jpg"),
  ];
}
