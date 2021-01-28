import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

import 'app_raised_button.dart';

class AppDialog extends StatelessWidget {
  final Widget icon;
  final String title;
  final String content;
  final Function(BuildContext context) onPositivePressed;
  final Function(BuildContext context) onNegativePressed;

  const AppDialog({
    Key key,
    this.content,
    this.icon,
    this.onPositivePressed,
    this.onNegativePressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              icon,
              SizedBox(height: 20),
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: kLineHeight(fontSize: 20, height: 25)),
              ),
              SizedBox(height: 20),
              Text(
                content ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: kLineHeight(fontSize: 16, height: 20)),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  _buildButton(
                      title: 'Later',
                      backgroundColor: Colors.grey,
                      onPressed: onNegativePressed),
                  SizedBox(width: 10),
                  _buildButton(title: 'Proceed', onPressed: onPositivePressed),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildButton(
      {String title,
      Color backgroundColor,
      Function(BuildContext context) onPressed}) {
    return Expanded(
      child: AppRaisedButton(
        elevation: 0,
        fontSize: 16,
        backgroundColor: backgroundColor,
        text: title,
        onPressed: onPressed,
      ),
    );
  }
}

class AppConfirmationDialog extends StatelessWidget {
  final Widget icon;
  final String title;
  final String content;
  final String buttonTitle;
  final Function(BuildContext context) onButtonPressed;

  const AppConfirmationDialog({
    Key key,
    this.content,
    this.icon,
    this.onButtonPressed,
    this.title,
    this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              icon,
              SizedBox(height: 20),
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: kLineHeight(fontSize: 20, height: 25)),
              ),
              SizedBox(height: 20),
              Text(
                content ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: kLineHeight(fontSize: 16, height: 20)),
              ),
              SizedBox(height: 30),
              _buildButton(title: buttonTitle, onPressed: onButtonPressed),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      {String title,
      Color backgroundColor,
      Function(BuildContext context) onPressed}) {
    return AppRaisedButton(
      elevation: 0,
      fontSize: 16,
      backgroundColor: backgroundColor,
      text: title,
      onPressed: onPressed,
    );
  }
}
