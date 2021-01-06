import 'package:flutter/material.dart';

class AppColors {
  static const stroke = Color(0x99E4E4E4);

  static const primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFf4f6fd),
      100: Color(0xFFbfc9f2),
      200: Color(0xFF94a4ea),
      300: Color(0xFF6a80e2),
      400: Color(0xFF3f5cd9),
      500: Color(_primaryValue),
      600: Color(0xFF1d3495),
      700: Color(0xFF15256b),
      800: Color(0xFF0d1640),
      900: Color(0xFF040715),
    },
  );
  static const int _primaryValue = 0xFF5770DE;
}
