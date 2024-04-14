import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/pages/home_page.dart';

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
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Login Page',
//       initialRoute: '/home',
//       getPages: [
//         GetPage(name: '/login', page: () => const LoginPage()),
//         GetPage(name: '/register', page: () => const RegisterPage()),
//         GetPage(name: '/home', page: () => const HomePage()),
//       ],
//     );
//   }
// }
