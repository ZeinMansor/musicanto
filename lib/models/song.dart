import 'package:musicanto/models/artist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Song {
  final int id;
  final String name;
  final Artist artist;
  final String type;
  final double price;
  final String thumbnailUrl;
  final String url;

  Song(this.id, this.name, this.artist, this.type, this.price,
      this.thumbnailUrl, this.url);

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        json['id'] as int,
        json['title'] as String,
        Artist.fromJson(json['artist']
            as Map<String, dynamic>), // Assuming artist data exists
        json['type'] as String,
        json['price']?.toDouble() ?? 0.0, // Handle null price gracefully
        // json['thumbnailUrl'] as String,
        "assets/images/1.jpg",
        "assets/music/music_01.mp3",
      );

  static List<Song> songs = [];
  // static List<Song> songs = [
  //   Song(1, "Song Name 1", Artist(0, "Artists one", "last name", "m", "syr"),
  //       "Classic", 220.0, "assets/images/1.jpg", "assets/music/music_01.mp3"),
  //   Song(2, "Song Name 2", Artist(0, "Artists tow", "last name", "m", "syr"),
  //       "Rock", 120.0, "assets/images/2.jpg", "assets/music/music_01.mp3"),
  //   Song(3, "Song Name 3", Artist(0, "Artists tow", "last name", "m", "syr"),
  //       "Rock", 120.0, "assets/images/3.jpg", "assets/music/music_01.mp3"),
  //   Song(4, "Song Name 4", Artist(0, "Artists tow", "last name", "m", "syr"),
  //       "Rock", 120.0, "assets/images/4.jpg", "assets/music/music_01.mp3"),
  //   Song(5, "Song Name 5", Artist(0, "Artists tow", "last name", "m", "syr"),
  //       "Rock", 120.0, "assets/images/5.jpg", "assets/music/music_01.mp3"),
  //   Song(6, "Song Name 6", Artist(0, "Artists tow", "last name", "m", "syr"),
  //       "Rock", 120.0, "assets/images/6.jpg", "assets/music/music_01.mp3"),
  // ];

  static void getSongs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String url =
        "https://wmb-svu-git-online-alisaleemhasans-projects.vercel.app/song/";

    String token = prefs.getString("token")!;
    var headers = {"Authorization": "Bearer $token"};
    try {
      print("BEFOR get request");
      final res = await http.get(Uri.parse(url), headers: headers);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        final songList = data['data'] as List<dynamic>;
        List<Song> songs =
            songList.map((songJson) => Song.fromJson(songJson)).toList();
        print("songs processed successfullt");

        Song.songs = songs;
        print("successfully loaded songs");
        // return songs
        // print(songs[0].);

        // print(data);
      }
    } catch (e) {
      print("Error getting songs list");
      print(e);
    }
  }
}
