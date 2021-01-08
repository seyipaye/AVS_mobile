import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

import 'loading_indicator.dart';

enum AppButton {
  EMAIL,
  APPLE,
  GOOGLE,
  OTP,
}

class AppRaisedButton extends StatelessWidget {
  const AppRaisedButton(
      {this.onPressed,
      this.text,
      this.textColor = Colors.white,
      this.backgroundColor,
      this.height,
      this.isLoading = false,
      this.minWidth,
      this.shrink = false,
      this.prefixIcon,
      this.fontSize,
      this.elevation});

  final Function(BuildContext context) onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Widget prefixIcon;
  final bool shrink;
  final double minWidth;

  /// The [Height] is 50.0 by default
  final double height;

  /// The [FontSize] is 16.0 by default
  final double fontSize;

  final bool isLoading;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final Text content = Text(
      text ?? '',
      style: TextStyle(fontSize: fontSize ?? 16),
    );
    return MaterialButton(
      height: height ?? 50,
      elevation: elevation ?? 2,
      minWidth: shrink ? null : double.infinity,
      onPressed: onPressed == null
          ? null
          : () {
              if (!isLoading) {
                onPressed(context);
              }
            },
      color: backgroundColor ?? AppColors.primaryColor,
      textColor: textColor,
      shape: kRoundedRectangleBorder,
      child: isLoading
          ? LoadingIndicator(
              color: textColor,
              radius: 15,
            )
          : prefixIcon == null
              ? content
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: prefixIcon,
                    ),
                    content
                  ],
                ),
    );
  }
}
