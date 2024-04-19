import 'package:musicanto/util/api.dart';

class Artist {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String country;

  Artist(this.id, this.firstName, this.lastName, this.gender, this.country);

  static List<Artist> artistsList = [];

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        json['id'] as int,
        json['FName'] as String,
        json['LName'] as String,
        json['gender'] as String,
        json['country'] as String,
      );

  static Future<void> loadArtists() async {
    var artists = await ApiDataHolder.loadArtists();

    if (artists == null) {
      artistsList == [];
    } else {
      artistsList = artists;
    }
  }
}
