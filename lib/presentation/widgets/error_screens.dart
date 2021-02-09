import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_raised_button.dart';

class NoConnectionScreen extends StatelessWidget {
  final Function(BuildContext context) onRetryPressed;

  const NoConnectionScreen({
    Key key,
    this.onRetryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Error',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          SvgPicture.asset(
            'assets/no_signal.svg',
            height: 200,
          ),
          SizedBox.shrink(),
          Text(
            'Unable to fetch requests at this time',
            style: TextStyle(fontSize: 16),
          ),
          AppRaisedButton(
            text: 'Retry',
            shrink: true,
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}

class EmptyRequestScreen extends StatelessWidget {
  final Function(BuildContext context) onRetryPressed;

  const EmptyRequestScreen({
    Key key,
    this.onRetryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/empty_box.svg',
            height: 200,
          ),
          Text(
            'No request found',
            style: TextStyle(fontSize: 16),
          ),
          AppRaisedButton(
            text: 'Retry',
            shrink: true,
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}
