import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicanto/models/song.dart';

class SongsComponent extends StatelessWidget {
  final List<Song> songs;

  const SongsComponent({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return Container(
          margin: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 16.0), // Add margin

          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8.0),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(song.thumbnailUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(song.name),
              subtitle: Text(song.artist.firstName),
            ),
          ),
        );
      },
    );
  }
}
