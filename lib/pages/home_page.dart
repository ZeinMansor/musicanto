import 'package:flutter/material.dart';
import 'package:musicanto/components/songs_componet.dart';
import 'package:musicanto/models/artist.dart';
import 'package:musicanto/models/song.dart';
import 'package:musicanto/pages/artists_page.dart';
import 'package:musicanto/pages/songs_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = [
      Song("Song Name 1", Artist(0, "Artists one", "last name", "m", "syr"),
          "https://example.com/thumbnail1.jpg"),
      Song("Song Name 2", Artist(0, "Artists tow", "last name", "m", "syr"),
          "https://example.com/thumbnail2.jpg"),
      // Add more songs here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Music App"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                "Music Player",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text("Songs"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SongManagementPage()),
              ),
            ),
            ListTile(
              title: const Text("Artists"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ArtistManagementPage()),
              ),
            ),
          ],
        ),
      ),
      body: SongsComponent(songs: songs),
    );
  }
}
