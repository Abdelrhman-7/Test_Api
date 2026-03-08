import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/forget_passowrd.dart';
import 'package:flutter_application_1/view/screen/register_screen.dart';
import 'package:flutter_application_1/view/screen/home.dart';
import 'package:flutter_application_1/view/screen/login_screen.dart';

class RoutManager {
  static const String login = '/loginscreen';
  static const String registerscreen = '/registerscreen';
  static const String home = '/home';
  static const String forgetPassword = "/forgetPassword";
  static const String newPassowrdScreen = "/newPassowrdScreen";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerscreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassowrd());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
/* case newPassowrdScreen:
        final email = settings.arguments as String? ?? "";
        return MaterialPageRoute(
          builder: (_) => NewPasswordScreen(email: email),
        );*/