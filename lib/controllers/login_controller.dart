import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  void loginUser() async {
    isLoading.value = true;

    // Add API Call here

    Get.offAllNamed("/home");
    // await Future.delayed(const Duration(seconds: 2));
    // isLoading.value = false;
    // if (emailController.text == "admin@localhost.com" &&
    //     passwordController.text == "123456") {
    //   Get.offAllNamed('/home'); // Navigate to main page
    // } else {
    //   Get.snackbar("Error", "Invalid credentials");
    // }
  }

  void registerPage() async {
    Get.offAllNamed("/register");
  }
}
