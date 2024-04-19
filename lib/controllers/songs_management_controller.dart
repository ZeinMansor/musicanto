import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SongsManagementController extends GetxController {
  final TextEditingController songTitleController = TextEditingController();
  final TextEditingController songTypeController = TextEditingController();
  final TextEditingController songPriceController = TextEditingController();
  final RxInt songArtistController = RxInt(0);

  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  RxBool isLoading = false.obs;

  void addNewSong() async {
    isLoading.value = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String url =
        "https://wmb-svu-git-online-alisaleemhasans-projects.vercel.app/auth/login";

    // Add API Call here
    try {
      Map<String, String> body = {
        "email": "emailController.text",
        "password": ""
      };

      final res = await http.post(Uri.parse(url), body: body);

      if (res.statusCode == 201 || res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        var token = data['backendTokens']['accessToken'];

        var firstName = data['FName'];
        var lastName = data['LName'];
        var email = data['email'];

        prefs.setString("token", token);

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
}
