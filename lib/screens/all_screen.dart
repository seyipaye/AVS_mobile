import 'package:avs/components/empty_verificatio_screen.dart';
import 'package:avs/components/verification_card.dart';
import 'package:flutter/material.dart';
import 'package:avs/constants.dart';

class AllScreen extends StatefulWidget {
  @override
  _AllScreenState createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
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
                "Verifications",
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
