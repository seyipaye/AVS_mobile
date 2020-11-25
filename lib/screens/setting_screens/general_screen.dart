import 'package:avs/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GeneralScreen extends StatefulWidget {
  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  dynamic profileImage = AssetImage('./images/profile_placeholder.png');

  void setProfilePicture() {
    setState(() {});
  }

  void removeProfilePicture() {
    profileImage = AssetImage('./images/profile_placeholder.png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: profileImage,
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Upload photo",
                    style: text,
                  ),
                  color: Theme.of(context).accentColor,
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
                  onPressed: () {
                    setState(() {
                      removeProfilePicture();
                    });
                  },
                  child: Text(
                    "Remove",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
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
                    labelText: 'Username',
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
                    labelText: 'First Name',
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
                    labelText: 'Last Name',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  enabled: false,
                  cursorColor: Theme.of(context).accentColor,
                  style: text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
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
                        color: Theme.of(context).accentColor,
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
        ),
      ),
    );
  }
}
