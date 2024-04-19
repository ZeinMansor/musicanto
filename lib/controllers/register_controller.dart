import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:musicanto/models/customer.dart';
import 'package:musicanto/util/api.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoading = false.obs;

  void loginPage() async {
    Get.offAllNamed("/login");
  }

  void registerUser() async {
    isLoading.value = true;

    // Add API Call here
    String url = "${ApiDataHolder.getUrl()}/auth/register";

    var body = {
      "username": emailController.text,
      "password": passwordController.text,
      "FName": firstNameController.text,
      "LName": lastNameController.text,
      "Address": "Damascus",
      "email": "test@test.com"
    };
    try {
      print("BEFOR get request");
      final res = await http.post(Uri.parse(url), body: body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        final customerJson = data['data'];
        Customer customer = Customer.fromJson(customerJson);
        print("registerd successfully");
        return Future(() => customer);
      }
    } catch (e) {
      print("Error registering new user");
      print(e);
    }
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
