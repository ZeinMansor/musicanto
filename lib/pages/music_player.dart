import 'package:flutter/material.dart';
import 'package:musicanto/models/song.dart';
import 'package:musicanto/state/music_player_state.dart';

class MusicPlayerPage extends StatefulWidget {
  final Song song;

  const MusicPlayerPage({super.key, required this.song});

  @override
  MusicPlayerPageState createState() => MusicPlayerPageState();
}
