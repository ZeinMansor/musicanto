import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/middleware/auth_middleware.dart';
import 'package:musicanto/pages/artists_page.dart';
import 'package:musicanto/pages/home_page.dart';
import 'package:musicanto/pages/login_page.dart';
import 'package:musicanto/pages/register_page.dart';
import 'package:musicanto/pages/song_page.dart';
import 'package:musicanto/pages/songs_management_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
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
      // home: const LoginPage(),
      initialRoute: "/login",
      getPages: [
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            middlewares: [AuthGuardMiddleware()]),
        GetPage(
          name: '/register',
          page: () => const RegisterPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/song',
          page: () => const SongPage(),
        ),
        GetPage(
          name: '/songs_management',
          page: () => const SongManagementPage(),
        ),
        GetPage(
          name: '/artists_management',
          page: () => const ArtistManagementPage(),
        ),
      ],
    );
  }
}
