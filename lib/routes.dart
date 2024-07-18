import 'package:chat_app/presentation/GuestPage/guest_page.dart';
import 'package:chat_app/presentation/HomePage/home_page.dart';
import 'package:chat_app/presentation/LoginPage/login_page.dart';
import 'package:chat_app/presentation/SignupPage/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();
  String login = '/';
  String guest = 'guest';
  String signup = 'signup';
  String home = 'home';

  Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => LoginPage(),
    'guest': (context) => const GuestPage(),
    'signup': (context) => SignupPage(),
    'home': (context) => const HomePage(),
  };
}
