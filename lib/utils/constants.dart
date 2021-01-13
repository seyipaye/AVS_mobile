import 'package:flutter/material.dart';

final kAnimationDuration = Duration(milliseconds: 300);

double kLineHeight({double fontSize, double height}) => height / fontSize;

TextStyle kInputTextStyle(context) => Theme.of(context)
    .textTheme
    .bodyText2
    .copyWith(fontWeight: FontWeight.w300, fontSize: 16);

TextStyle kHeaderTextStyle(context) => Theme.of(context)
    .textTheme
    .bodyText1
    .copyWith(fontWeight: FontWeight.bold, fontSize: 20);

final kRoundedRectangleBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(5),
);

final kRoundedTopRectangleBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(34),
    topRight: Radius.circular(34),
  ),
);
