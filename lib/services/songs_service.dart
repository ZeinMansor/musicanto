import 'dart:convert';

import 'package:musicanto/models/song.dart';
import 'package:http/http.dart' as http;

class SongService {
  static const String baseUrl = 'http://localhost:3000/songs';

  static Future<List<Song>> loadSongs() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Song.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load songs: ${response.statusCode}');
    }
  }
}
