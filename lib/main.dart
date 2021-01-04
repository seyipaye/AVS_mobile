import 'package:avs/pages/forgot_password_page.dart';
import 'package:avs/pages/log_in_page.dart';
import 'package:avs/pages/registration_page.dart';
import 'package:avs/pages/update_verification_page.dart';
import 'package:avs/screens/all_screen.dart';
import 'package:avs/screens/dashboard_screen.dart';
import 'package:avs/screens/profile_screen.dart';
import 'package:avs/screens/settings.dart';
import 'package:avs/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import './pages/home_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(AVSApp());
}

class AVSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFFFFC548),
          accentColor: Color(0xFF2A3142),
          buttonTheme: ThemeData.light().buttonTheme,
          cursorColor: Color(0xFF2A3142),
        ),
        home: HomePage(
          screen: LogInPage(),
        ));
  }
}

// Color(0xFFFFC548)
