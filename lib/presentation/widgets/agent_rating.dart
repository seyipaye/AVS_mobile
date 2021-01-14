import 'package:avs/utils/constants.dart';
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
              style: kBoldTextStyle(context),
            ),
            SizedBox(
              width: 5,
            ),
            for (int i = 0; i < 5; i++)
              Icon(
                !(double.parse(rating) > i && double.parse(rating) < i + 1)
                    ? CupertinoIcons.star_fill
                    : CupertinoIcons.star_lefthalf_fill,
                size: 15,
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
