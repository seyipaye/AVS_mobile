import 'package:avs/presentation/screens/home_screen.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/register.dart';

void main() {
  runApp(AVSApp());
}

class AVSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: AppColors.primaryColor,
        // accentColor: Color(0xFF2A3142),
        // buttonTheme: ThemeData.light().buttonTheme,
        // cursorColor: Color(0xFF2A3142),
      ),
      home: HomeScreen(),
    );
  }
}
