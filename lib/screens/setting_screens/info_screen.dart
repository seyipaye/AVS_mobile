import 'package:flutter/material.dart';
import 'package:avs/constants.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int selectedSex;

  /// Function to set radio button values*/
  void setSelectedSex(int val) {
    setState(() {
      selectedSex = val;
    });
  }

  @override
  void initState() {
    super.initState();
    int selectedSex = 0;
  }

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
              style: TextStyle(height: 1),
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bio',
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
                labelText: 'Birth Date',
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
                labelText: 'Mobile',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Gender",
              style: subHeader,
            ),
            SizedBox(
              height: 10,
            ),

            /// Row holding radio buttons*/
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: selectedSex,
                      onChanged: (val) {
                        setSelectedSex(val);
                      },
                      activeColor: Theme.of(context).accentColor,
                    ),
                    Text(
                      "Male",
                      style: text,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: selectedSex,
                      onChanged: (val) {
                        setSelectedSex(val);
                      },
                      activeColor: Theme.of(context).accentColor,
                    ),
                    Text(
                      "Female",
                      style: text,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: selectedSex,
                      onChanged: (val) {
                        setSelectedSex(val);
                      },
                      activeColor: Theme.of(context).accentColor,
                    ),
                    Text(
                      "Other",
                      style: text,
                    )
                  ],
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
