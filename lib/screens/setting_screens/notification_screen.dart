import 'package:avs/screens/setting_screens/general_screen.dart';
import 'package:flutter/material.dart';
import 'package:avs/constants.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool acceptRequest = false;
  bool approveRequest = false;
  bool rejectRequests = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Activity', style: subHeader),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Switch(
                  value: acceptRequest,
                  onChanged: (bool newValue) {
                    setState(() {
                      acceptRequest = newValue;
                    });
                  },
                  activeColor: Theme.of(context).accentColor,
                  activeTrackColor: Theme.of(context).accentColor,
                ),
                Flexible(
                  child: Text(
                    'Email me when someone accepts my request',
                    style: text,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Switch(
                  value: approveRequest,
                  onChanged: (bool newValue) {
                    setState(() {
                      approveRequest = newValue;
                    });
                  },
                  activeColor: Theme.of(context).accentColor,
                  activeTrackColor: Theme.of(context).accentColor,
                ),
                Flexible(
                  child: Text(
                    'Email me when someone approves my request',
                    style: text,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Switch(
                  value: rejectRequests,
                  onChanged: (bool newValue) {
                    setState(() {
                      rejectRequests = newValue;
                    });
                  },
                  activeColor: Theme.of(context).accentColor,
                  activeTrackColor: Theme.of(context).accentColor,
                ),
                Flexible(
                  child: Text(
                    'Email me when someone rejects my request',
                    style: text,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Save Changes",
                      style: text,
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  OutlineButton(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {},
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
