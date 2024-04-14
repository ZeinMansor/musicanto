import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicanto/pages/music_player.dart';

class MusicPlayerPageState extends State<MusicPlayerPage> {
  bool isPlaying = false;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.setSource(UrlSource(widget.song.url)); // Set audio source
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop(); // Release audio resources when page is disposed
  }

  void _togglePlayback() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playing ${widget.song.name}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.song.name,
              style: TextStyle(fontSize: 24.0),
            ),
            Text(widget.song.artist.firstName + widget.song.artist.lastName),
            SizedBox(height: 20.0),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 50.0,
              onPressed: _togglePlayback,
            ),
          ],
        ),
      ),
    );
  }
}
