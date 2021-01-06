import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  LoadingIndicator({
    Key key,
    this.color,
    double radius,
  }) : super(key: key) {
    if (radius != null) {
      this.height = radius;
      this.width = radius;
    }
  }

  final Color color;
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        // backgroundColor: Colors.black,
        valueColor: AlwaysStoppedAnimation(color),
        strokeWidth: 1.8,
      ),
    );
  }
}
