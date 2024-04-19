import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/pages/home_page.dart';
import 'package:musicanto/pages/login_page.dart';
import 'package:musicanto/pages/register_page.dart';
import 'package:musicanto/pages/song_page.dart';
import 'package:musicanto/pages/songs_management_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Music App WMB',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        disabledColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/song', page: () => const SongPage()),
        GetPage(
            name: '/songs_management', page: () => const SongManagementPage()),
      ],
    );
  }
}
