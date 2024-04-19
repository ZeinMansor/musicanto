import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/controllers/songs_management_controller.dart';
import 'package:http/http.dart' as http;
import 'package:musicanto/models/artist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtistDropdown extends StatefulWidget {
  final String apiUrl; // URL of your artist API endpoint
  final SongsManagementController songController; // GetX controller instance

  const ArtistDropdown(
      {Key? key, required this.apiUrl, required this.songController})
      : super(key: key);

  @override
  State<ArtistDropdown> createState() => _ArtistDropdownState();
}

class _ArtistDropdownState extends State<ArtistDropdown> {
  List<DropdownMenuItem<int>> _artists = [];
  Future<void>? _futureArtists;

  @override
  void initState() {
    super.initState();
    _futureArtists = _fetchArtists();
  }

  Future<void> _fetchArtists() async {
    print("API URL");
    print(widget.apiUrl);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token")!;

    var headers = {"Authorization": "Bearer $token"};
    final response = await http.get(Uri.parse(widget.apiUrl), headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Artist> artists =
          data["data"].map((songJson) => Artist.fromJson(songJson)).toList();
      print("DATA XXX");
      print(data.toString());
      setState(() {
        _artists = artists
            .map((artist) => DropdownMenuItem(
                  value: artist.id,
                  child: Text("${artist.firstName} ${artist.lastName}"),
                ))
            .toList();
      });
    } else {
      // Handle API error

      print('Error fetching artists: ${response.reasonPhrase}');
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_artists);
    return FutureBuilder<void>(
      future: _futureArtists,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DropdownButtonFormField<int>(
            value: widget
                .songController.songArtistController.value, // Set initial value
            items: _artists,
            onChanged: (value) {
              widget.songController.songArtistController.value =
                  value!; // Update controller
            },
            hint: const Text('Select Artist'),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
