import 'package:flutter/material.dart';
import 'package:avs/constants.dart';

class EmptyVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset('./images/empty.png'),
              Text(
                'Ooopss!! No verifications is available at the moment.',
                style: subHeader,
              )
            ],
          ),
        ),
      ),
    );
  }
}
