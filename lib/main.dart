import 'package:avs/screens/forgot_password_page.dart';
import 'package:avs/screens/log_in_page.dart';
import 'package:flutter/material.dart';
import './screens/home_page.dart';

void main() {
  runApp(AVSApp());
}

class AVSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInPage(),
    );
  }
}
