import 'package:avs/utils/constants.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Color color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Widget child;
  final GestureTapCallback onTap;
  final double radius;
  final double height;
  final blurRadius;
  final Border border;
  final List<BoxShadow> boxShadow;

  const AppCard({
    Key key,
    this.color = Colors.white,
    this.child,
    this.radius = 16.0,
    this.blurRadius = 16.0,
    this.boxShadow,
    this.border,
    this.margin,
    this.height,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: border,
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: boxShadow ?? [kDropShadow(0, blurRadius, blurRadius)],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: padding,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
