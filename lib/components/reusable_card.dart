import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final Color textColor;

  ReusableCard(
      {@required this.colour, this.cardChild, this.onPress, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: cardChild,
          ),
        ),
      ),
    );
  }
}
