import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreference();
  }

  void initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Music icon with card (unchanged)
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.music_note,
                  size: 40.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Text fields in a column
            Column(
              children: [
                TextField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10.0), // Add space between fields
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Add footer row (unchanged)

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle forgot password logic (e.g., navigate to reset page)
                    print('Forgot Password pressed');
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Align elements
              children: [
                // Login button (unchanged)
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.loginUser,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ),
                // Forgot password text
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.registerPage,
                  child: const Text('Register'),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Copyright © 2024 YourAppName'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
