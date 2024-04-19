import 'dart:ui';

import 'package:get/get.dart';
import 'package:musicanto/models/artist.dart';
import 'package:musicanto/models/order.dart';
import 'package:musicanto/models/song.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiDataHolder {
  static String productionBaseUrl =
      "https://wmb-svu-git-online-alisaleemhasans-projects.vercel.app";

  static String developmentBaseUrl = "http://127.0.0.1:3000/";

  static String getUrl() {
    String env = "DEV";

    if (env == "dev") {
      return developmentBaseUrl;
    } else {
      return productionBaseUrl;
    }
  }

  static Future<List<Song>?> loadSongs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token")!;

    String url = "${getUrl()}/song";

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

        return Future(() => songs);
      }
    } catch (e) {
      Get.snackbar("sad", "asd");
      print("Error getting songs list");
      print(e);
    }
  }

  static Future<Song?> addNewSong(
      int artistsId, String title, String type, int price) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token")!;

    String url = "${getUrl()}/artist/${artistsId.toString()}/song";

    var headers = {"Authorization": "Bearer $token"};
    var body = {"title": title, "type": type, "price": price};
    try {
      print("BEFOR get request");
      final res = await http.post(Uri.parse(url), headers: headers, body: body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        final songData = data['data'];
        Song songs = Song.fromJson(songData);
        print("songs processed successfullt");
        print("successfully loaded songs");
        return Future(() => songs);
      }
    } catch (e) {
      print("Error adding new song songs list");
      print(e);
    }
  }

  static Future<Song?> deleteSong(int songId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token")!;

    String url = "${getUrl()}/song/$songId";

    var headers = {"Authorization": "Bearer $token"};
    try {
      print("BEFOR get request");
      final res = await http.delete(Uri.parse(url), headers: headers);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        final songData = data['data'];
        final affectedRows = songData['affected'] as int;

        if (affectedRows > 0) {
          print("Deleted successfully");
        }
      }
    } catch (e) {
      print("Error adding new song songs list");
      print(e);
    }
    return null;
  }

  static Future<List<Artist>?> loadArtists() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token")!;

    String url = "${getUrl()}/artist/";

    var headers = {"Authorization": "Bearer $token"};
    try {
      print("BEFOR getting artists data");
      final res = await http.get(Uri.parse(url), headers: headers);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("Artists in fetch data");
        print(data);
        final artistsList = data['data'] as List<dynamic>;
        List<Artist> artists = artistsList
            .map((artistJson) => Artist.fromJson(artistJson))
            .toList();
        return Future(() => artists);
      }
    } catch (e) {
      print("Error getting artists list");
      print(e);
    }
  }

  static Future<Artist?> addNewArtist(
      String firstName, String lastName, String gender, String country) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token")!;

    String url = "${getUrl()}/artist/";

    var headers = {"Authorization": "Bearer $token"};
    var body = {
      "FName": firstName,
      "LName": lastName,
      "gender": gender,
      "country": country
    };
    try {
      print("BEFOR posting new artist data   request");
      final res = await http.post(Uri.parse(url), headers: headers, body: body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        final artistData = data['data'];
        Artist artist = Artist.fromJson(artistData);

        print("successfully add new artist");
        return Future(() => artist);
      }
    } catch (e) {
      print("Error adding new artist");
      print(e);
    }
  }

  static Future<List<Order>?> getAllOrders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token")!;

    String url = "${getUrl()}/order/";

    var headers = {"Authorization": "Bearer $token"};
    try {
      print("BEFOR getting orders data");
      final res = await http.get(Uri.parse(url), headers: headers);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        final ordersList = data['data'] as List<dynamic>;
        List<Order> orders =
            ordersList.map((orderJson) => Order.fromJson(orderJson)).toList();
        return Future(() => orders);
      }
    } catch (e) {
      print("Error getting orders list");
      print(e);
    }
  }

  static Future<Order?> addNewOrder(int songId, String creditCard) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token")!;

    String url = "${getUrl()}/order/";
    var customerId = prefs.getInt("customerId")!.toInt();
    var headers = {"Authorization": "Bearer $token"};
    var body = {
      "customerId": customerId,
      "songIds": [songId],
      "invoice": {
        "date": DateTime.now().toIso8601String(),
        "creditCard": creditCard
      }
    };
    try {
      print("BEFOR adding new orders");
      final res = await http.post(Uri.parse(url), headers: headers, body: body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        final orderJson = data['data'];
        Order order = Order.fromJson(orderJson);
        return Future(() => order);
      }
    } catch (e) {
      print("Error adding new orders");
      print(e);
    }
  }
}
