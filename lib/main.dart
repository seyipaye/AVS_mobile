import 'package:avs/pages/forgot_password_page.dart';
import 'package:avs/pages/log_in_page.dart';
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
      home: HomePage(),
    );
  }
}
