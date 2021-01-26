import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key key,
    this.color,
    this.radius = 20,
    this.strokeWidth = 1.8,
  }) : super(key: key);

  final Color color;
  final double radius;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      width: radius,
      child: CircularProgressIndicator(
        // backgroundColor: Colors.black,
        valueColor: AlwaysStoppedAnimation(color),
        strokeWidth: strokeWidth,
      ),
    );
  }
}
