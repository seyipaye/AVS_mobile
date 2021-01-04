import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Theme.of(context).accentColor,
              style: text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Old Password',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Theme.of(context).accentColor,
              style: text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New Password',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Theme.of(context).accentColor,
              style: text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
              ),
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
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: 30,
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
