import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentRating extends StatelessWidget {
  final String rating;

  const AgentRating({Key key, this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              rating,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            for (int i = 0; i < 5; i++)
              Icon(
                CupertinoIcons.star_fill,
                size: 10,
                color:
                    i < double.parse(rating) ? Color(0xFFFFA502) : Colors.grey,
              )
          ],
        ),
        Text('Rating'),
      ],
    );
  }
}
