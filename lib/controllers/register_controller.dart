import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoading = false.obs;

  void loginPage() async {
    Get.offAllNamed("/login");
  }

  void registerUser() async {
    isLoading.value = true;

    // Add API Call here

    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    // submit data to the backend
    if (emailController.text == "admin@localhost.com" &&
        passwordController.text == "123456") {
      Get.offAllNamed('/home'); // Navigate to main page
    } else {
      Get.snackbar("Error", "Invalid credentials");
    }
  }
}
