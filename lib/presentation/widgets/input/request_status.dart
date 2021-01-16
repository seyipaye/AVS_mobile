import 'package:flutter/material.dart';

class RequestStatus extends StatelessWidget {
  final String status;
  final Color color;

  const RequestStatus({this.color, this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(status, style: TextStyle(fontSize: 13)),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
