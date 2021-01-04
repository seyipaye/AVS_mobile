import 'package:flutter/material.dart';
import 'package:avs/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateVerificationPage extends StatefulWidget {
  @override
  _UpdateVerificationPageState createState() => _UpdateVerificationPageState();
}

class _UpdateVerificationPageState extends State<UpdateVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AVS'),
        backgroundColor: activeCard,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Update Verification',
                  style: header,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Container(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.retweet),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Refresh",
                          style: text,
                        ),
                      ],
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(height: 30),
                Text(
                  'Type',
                  style: subHeader,
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.home,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Live Photo Address Verification',
                          style: text,
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  'Customer',
                  style: subHeader,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.user,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                'Richard Jack',
                                style: text,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapMarker,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                '1279 Mohammadu Buhari Way, Garki, Abuja, FCT. Nigeria',
                                style: text,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Task Details',
                      style: subHeader,
                    ),
                    Icon(
                      FontAwesomeIcons.paperclip,
                      size: 20,
                    )
                  ],
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.clock,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                'Nov 24, 2020 - __',
                                style: text,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.clipboard,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                'Verify Richard Jack',
                                style: text,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Notes',
                      style: subHeader,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            "View",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          child: Text(
                            "Notes",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                /// Note Card List goes here

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Signature',
                      style: subHeader,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            "View",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          child: Text(
                            "Signature",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                /// Signature Card goes here
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'My Location',
                      style: subHeader,
                    ),
                    InkWell(
                      child: Text(
                        'Geo-tag Me',
                        style: TextStyle(
                            fontSize: 20, color: Theme.of(context).accentColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Task Details',
                          style: subHeader,
                        ),
                        Icon(
                          FontAwesomeIcons.paperclip,
                          size: 20,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          child: Text(
                            "Images",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                RaisedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text('Verified'),
                  ),
                  color: Theme.of(context).accentColor,
                ),
                OutlineButton(
                  borderSide: BorderSide(width: 1.0, color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Not Verified",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
