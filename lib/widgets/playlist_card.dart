import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:musicanto/models/playlist.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playlists,
  });

  final PlayList playlists;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Navigate to playlist page");
        // Get.toNamed("/")
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: AssetImage(playlists.imageUrl),
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlists.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    playlists.description,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
