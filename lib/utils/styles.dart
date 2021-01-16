import 'package:flutter/material.dart';

class AppColors {
  static const stroke = Color(0xFFced4da);

  static const background = Color(0xFFf8f8fb);

  static const drawerBackground = Color(0xFF2a3042);

  static const icons = Color(0xFF555b6d);

  static const offset = Color(0x14323247);

  static const text2 = Color(0xFF999999);

  // #555b6d;

  // #2a3042;

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

class AppTheme {
  get light => ThemeData(
        brightness: Brightness.light,
        primarySwatch: AppColors.primaryColor,
        // accentColor: Color(0xFF2A3142),
        // buttonTheme: ThemeData.light().buttonTheme,
        // cursorColor: Color(0xFF2A3142),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.icons),
          color: Colors.white,
          elevation: .5,
          textTheme: TextTheme(
            headline6: Typography.blackCupertino.headline6.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.stroke, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
        ),
      );
}
