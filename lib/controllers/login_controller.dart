import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:musicanto/models/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  RxBool isLoading = false.obs;

  void loginUser() async {
    isLoading.value = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String url =
        "https://wmb-svu-git-online-alisaleemhasans-projects.vercel.app/auth/login";

    // Add API Call here
    try {
      Map<String, String> body = {
        "email": emailController.text,
        "password": passwordController.text
      };

      final res = await http.post(Uri.parse(url), body: body);

      if (res.statusCode == 201 || res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        var token = data['backendTokens']['accessToken'];

        var customserData = data['customer'];

        print(customserData);

        Customer customer = Customer.fromJson(customserData);

        prefs.setString("token", token);
        prefs.setString("firstName", customer.firstName);
        prefs.setString("lastName", customer.lastName);
        prefs.setString("email", customer.email);
        prefs.setInt("customerId", customer.id);

        print(data.toString());
        isLoading.value = false;

        Get.offAllNamed("/home");
      } else {
        print("Failed to load data");
        print(res.body.toString());
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  void registerPage() async {
    Get.offAllNamed("/register");
  }

  void logout() async {
    // clear token
    Get.offAllNamed("/login");
  }
}
