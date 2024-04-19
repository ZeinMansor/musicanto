import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/components/custome_text_field.dart';
import 'package:musicanto/components/section_header.dart';
import 'package:musicanto/controllers/artists_controller.dart';
import 'package:musicanto/models/artist.dart';
import 'package:musicanto/models/playlist.dart';
import 'package:musicanto/widgets/artist_list_card.dart';
import 'package:musicanto/widgets/playlist_card.dart';

class ArtistManagementPage extends StatefulWidget {
  const ArtistManagementPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArtistManagementPageState createState() => _ArtistManagementPageState();
}

class _ArtistManagementPageState extends State<ArtistManagementPage> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  List<Artist> artists = []; // List to store artists

  String _firstName = "";
  String _lastName = "";
  String _gender = ""; // Added gender field
  String _country = ""; // Added country field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Artists"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Form for adding a new artist
            _buildAddArtistForm(),
            // List of existing artists with delete option
            _buildArtistList(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddArtistForm() {
    final ArtistsController controller = Get.put(ArtistsController());
    Artist.loadArtists();
    List<Artist> artists = Artist.artistsList;

    return Container(
      padding: const EdgeInsets.all(8.0), // Add padding for better spacing
      margin: const EdgeInsets.all(8.0),

      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomeTextField(
              controller: controller.firstName,
              fieldLable: "First Name",
              validationErrorMessage: "This field is required",
              icon: Icons.ac_unit,
              obsecureText: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomeTextField(
              controller: controller.firstName,
              fieldLable: "Last Name",
              validationErrorMessage: "This field is required",
              icon: Icons.ac_unit,
              obsecureText: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomeTextField(
              controller: controller.firstName,
              fieldLable: "Country Name",
              validationErrorMessage: "This field is required",
              icon: Icons.flag_circle,
              obsecureText: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
              // Added dropdown for gender
              decoration: InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              items: ["Male", "Female"]
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(
                          gender,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _gender = value as String),
              validator: (value) =>
                  value == null ? "Please select gender" : null,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Add logic to save the new artist (e.g., add to list, database)
                  setState(() {
                    artists.add(
                        Artist(0, _firstName, _lastName, _gender, _country));
                    _firstName = ""; // Clear form fields after adding
                    _lastName = "";
                    _gender = "";
                    _country = "";
                  });
                }
              },
              child: const Text("Add Artist"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Artists List",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.deepPurple),
                      ),
                      Text(
                        "delete",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.deepPurple.shade500),
                      )
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 20.0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: artists.length,
                    itemBuilder: ((context, index) {
                      return ArtistListCard(artists: artists[index]);
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildArtistList() {
    return ListView.builder(
      shrinkWrap: true, // Prevent list view from taking full height
      itemCount: artists.length,
      itemBuilder: (context, index) {
        final artist = artists[index];
        return ListTile(
          title: Text("${artist.firstName} ${artist.lastName}"),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteArtist(artist), // Delete functionality
          ),
        );
      },
    );
  }

  void _deleteArtist(Artist artist) {
    setState(() {
      artists.remove(artist);
    });
  }
}
