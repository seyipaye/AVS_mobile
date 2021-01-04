import 'package:avs/components/empty_verificatio_screen.dart';
import 'package:avs/components/verification_card.dart';
import 'package:flutter/material.dart';
import 'package:avs/utils/constants.dart';

class RejectedScreen extends StatefulWidget {
  @override
  _RejectedScreen createState() => _RejectedScreen();
}

class _RejectedScreen extends State<RejectedScreen> {
  Widget page = VerificationCard();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Rejected Verification",
                style: header,
              ),
              SizedBox(
                height: 30,
              ),
              page
            ],
          ),
        ),
      ),
    );
  }
}
