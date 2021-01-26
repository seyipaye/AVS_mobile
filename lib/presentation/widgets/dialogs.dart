import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

import 'app_raised_button.dart';

class AppDialog extends StatelessWidget {
  final Widget icon;
  final String content;
  final Function(BuildContext context) onPositivePressed;
  final Function(BuildContext context) onNegativePressed;

  const AppDialog({
    Key key,
    this.content,
    this.icon,
    this.onPositivePressed,
    this.onNegativePressed,
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
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: kLineHeight(fontSize: 20, height: 25)),
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

class ConfirmationDialog extends StatefulWidget {
  ConfirmationDialog(
      {this.title, this.content, this.buttonText, this.onConfirmPressed});

  final Future Function(BuildContext) onConfirmPressed;
  final String title;
  final String content;
  final String buttonText;

  @override
  _ConfirmationDialogState createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  bool isLoading = false;

  onConfirmPressed(context) async {
    setState(() => isLoading = true);
    await widget.onConfirmPressed(context);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
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
            SizedBox(height: 10),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.content,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.text2),
            ),
            SizedBox(height: 20),
            AppRaisedButton(
              text: widget.buttonText,
              isLoading: isLoading,
              onPressed: onConfirmPressed,
            ),
          ],
        ),
      ),
    );
  }
}
