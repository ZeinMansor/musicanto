import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:musicanto/main.dart';

class AuthGuardMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    String? token = prefs?.getString("token");
    print("Token in the middleware $token");
    if (token != null) {
      return const RouteSettings(name: "/home");
    } else {
      return const RouteSettings(name: "/login");
    }
  }
}
