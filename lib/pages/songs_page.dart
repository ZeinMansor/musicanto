import 'package:flutter/material.dart';
import 'package:musicanto/models/artist.dart';
import 'package:musicanto/models/song.dart';

class SongManagementPage extends StatefulWidget {
  const SongManagementPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SongManagementPageState createState() => _SongManagementPageState();
}

class _SongManagementPageState extends State<SongManagementPage> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  List<Song> songs = []; // List to store songs

  // Song data holders for editing/adding
  String _name = "";
  String _artist = "";
  String _thumbnailUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Songs"),
      ),
      body: SingleChildScrollView(
        // Allow scrolling for long song lists
        child: Column(
          children: [
            // Form for adding a new song
            _buildAddSongForm(),
            // List of existing songs with delete and edit options
            _buildSongList(),
          ],
        ),
      ),
    );
  }

  // Function to build the form for adding a new song
  Widget _buildAddSongForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Song Name"),
            validator: (value) =>
                value!.isEmpty ? "Please enter a song name" : null,
            onSaved: (value) => setState(() => _name = value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Artist"),
            validator: (value) =>
                value!.isEmpty ? "Please enter the artist" : null,
            onSaved: (value) => setState(() => _artist = value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Thumbnail URL"),
            validator: (value) =>
                value!.isEmpty ? "Please enter a thumbnail URL" : null,
            onSaved: (value) => setState(() => _thumbnailUrl = value!),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Add logic to save the new song (e.g., add to list, database)
                setState(() {
                  songs.add(Song(
                      _name,
                      Artist(0, _artist, _artist, "_name", " _name"),
                      "type",
                      222,
                      _thumbnailUrl,
                      "song_url"));
                  _name = ""; // Clear form fields after adding
                  _artist = "";
                  _thumbnailUrl = "";
                });
              }
            },
            child: const Text("Add Song"),
          ),
        ],
      ),
    );
  }

  // Function to build the list of existing songs
  Widget _buildSongList() {
    return ListView.builder(
      shrinkWrap: true, // Prevent list view from taking full height
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return ListTile(
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min, // Control trailing widget size
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _editSong(song), // Edit functionality
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _deleteSong(song), // Delete functionality
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to handle editing a song (replace with actual edit logic)
  void _editSong(Song song) {
    // Implement logic to edit the song information
    print("Edit song: ${song.name}");
  }

  // Function to handle deleting a song (replace with actual delete logic)
  void _deleteSong(Song song) {
    setState(() {
      songs.remove(song);
    });
  }
}
