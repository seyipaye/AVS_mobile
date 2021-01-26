import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

TextStyle get kLabelTextStyle => TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      //color: AppColors.label,
    );

BoxShadow kDropShadow(double dx, double dy, double blurRadius,
        {color = AppColors.offset}) =>
    BoxShadow(
      offset: Offset(dx, dy),
      blurRadius: blurRadius,
      color: color,
    );

final kAnimationDuration = Duration(milliseconds: 300);

double kLineHeight({double fontSize, double height}) => height / fontSize;

TextStyle kInputTextStyle(context) => Theme.of(context)
    .textTheme
    .bodyText2
    .copyWith(fontWeight: FontWeight.w300, fontSize: 16);

TextStyle kBoldTextStyle(context) => Theme.of(context)
    .textTheme
    .bodyText2
    .copyWith(fontWeight: FontWeight.bold, fontSize: 20);

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
