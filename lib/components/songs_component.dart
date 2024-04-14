import 'package:flutter/material.dart';
import 'package:musicanto/models/song.dart';
import 'package:musicanto/widgets/song_card.dart';

class SongsList extends StatelessWidget {
  const SongsList({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
          itemCount: songs.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SongCard(song: songs[index]);
          }),
    );
  }
}
