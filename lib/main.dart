import 'package:flutter/material.dart';

import 'home_screen.dart';

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
        home: HomeScreen());
  }
}

// Color(0xFFFFC548)
