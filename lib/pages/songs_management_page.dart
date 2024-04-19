// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:musicanto/controllers/songs_management_controller.dart';
import 'package:musicanto/models/artist.dart';
import 'package:musicanto/models/song.dart';
import 'package:musicanto/util/api.dart';
import 'package:musicanto/widgets/artists_dropdown.dart';

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
    final SongsManagementController controller =
        Get.put(SongsManagementController());

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add new song",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.music_note,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: controller.songTitleController,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a song title" : null,
                  onSaved: (value) => setState(() => _name = value!),
                  decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: controller.songTypeController,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a song type" : null,
                  onSaved: (value) => setState(() => _name = value!),
                  decoration: const InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: controller.songPriceController,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a song price" : null,
                  onSaved: (value) => setState(() => _name = value!),
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                ArtistDropdown(
                  apiUrl: "${ApiDataHolder.getUrl()}/artist/",
                  songController: controller,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Add logic to save the new song (e.g., add to list, database)
                    }
                  },
                  child: const Text("Add Song"),
                ),
              ],
            ),
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
