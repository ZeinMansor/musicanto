import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/components/section_header.dart';
import 'package:musicanto/components/songs_component.dart';
import 'package:musicanto/controllers/login_controller.dart';
import 'package:musicanto/models/playlist.dart';
import 'package:musicanto/models/song.dart';
import 'package:musicanto/widgets/playlist_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    Song.getSongs();
    List<Song> songs = Song.songs;

    print("Calling getSongs");

    List<PlayList> playlists = PlayList.playlists;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _CustomAppBar(loginController: loginController),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _CustomSearchField(),
              _TrendingMusic(songs: songs),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SectionHeader(title: "Playlists"),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 20.0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: playlists.length,
                      itemBuilder: ((context, index) {
                        return PlaylistCard(playlists: playlists[index]);
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const _CustomBottomNavBar(),
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: "Trending Music"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SongsList(songs: songs)
        ],
      ),
    );
  }
}

class _CustomSearchField extends StatelessWidget {
  const _CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcom",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            "Enjoy your favorit music",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none),
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey.shade400)),
          )
        ],
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Get.toNamed("/login"),
                icon: const Icon(Icons.favorite_outline)),
            label: "Favorits"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => () => Get.toNamed("/home"),
                icon: const Icon(Icons.home)),
            label: "Home"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => Get.toNamed("/songs_management"),
              icon: const Icon(Icons.play_circle_outlined),
            ),
            label: "Play"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.propane_outlined),
            ),
            label: "Artists"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => Get.toNamed("/artists_management"),
              icon: const Icon(Icons.person_2_outlined),
            ),
            label: "Artists Management")
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // title: const Text("Music App"),
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage:
                NetworkImage("https://avatar.iran.liara.run/public/boy"),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
