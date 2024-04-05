import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArtistsController extends GetxController {
  bool isLoading = false;

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController country = TextEditingController();
}
