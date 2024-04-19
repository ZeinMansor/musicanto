import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:musicanto/main.dart';

class AuthGuardMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    String? token = prefs?.getString("token");
    if (token != null) {
      return const RouteSettings(name: "/home");
    }
  }
}
