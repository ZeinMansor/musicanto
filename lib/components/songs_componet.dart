import 'package:flutter/material.dart';
import 'package:musicanto/models/song.dart';

// class SongsComponent extends StatelessWidget {
//   final List<Song> songs;
//   final Function(Song, AudioPlayer) onSongClicked;
//   const SongsComponent(
//       {super.key, required this.songs, required this.onSongClicked});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: songs.length,
//       itemBuilder: (context, index) {
//         final song = songs[index];
//         return Container(
//           margin: const EdgeInsets.symmetric(
//               vertical: 8.0, horizontal: 16.0), // Add margin

//           child: Material(
//             elevation: 4.0,
//             borderRadius: BorderRadius.circular(8.0),
//             child: ListTile(
//               leading: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: NetworkImage(song.thumbnailUrl),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               title: Text(song.name),
//               subtitle: Text(song.artist.firstName),
//               onTap: onSongClicked(song, AudioPlayer()),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class SongComponent extends StatelessWidget {
  final Song song;
  final Function(Song) onSongClicked;

  const SongComponent(
      {super.key, required this.song, required this.onSongClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSongClicked(song),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png',
                image: song.thumbnailUrl,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.name,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${song.artist.firstName} ${song.artist.lastName}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
