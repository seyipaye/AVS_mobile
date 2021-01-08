import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static SnackBar error(String _message) {
    return SnackBar(
      content: Text(_message),
      backgroundColor: Colors.red,
    );
  }

  static SnackBar neutral(String _message) {
    return SnackBar(
      content: Text(
        _message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      //backgroundColor: AppColors.subtitle,
    );
  }

  static SnackBar success(String _message) {
    return SnackBar(
      content: Text(_message),
      backgroundColor: Colors.lightGreen,
    );
  }
}
