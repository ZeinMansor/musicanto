import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/controllers/songs_management_controller.dart';
import 'package:http/http.dart' as http;
import 'package:musicanto/models/artist.dart';
import 'package:musicanto/util/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtistDropdown extends StatefulWidget {
  final SongsManagementController songController; // GetX controller instance

  const ArtistDropdown({Key? key, required this.songController})
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
    await Artist.loadArtists();
    List<Artist> artists = Artist.artistsList;
    print("Gender in fetch artists");
    setState(() {
      _artists = artists
          .map((artist) => DropdownMenuItem(
                value: artist.id,
                child: Text("${artist.firstName} ${artist.lastName}"),
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Artists in drop down");
    print(_artists.length);
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
