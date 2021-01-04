import 'package:avs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                // The containers in the background
                new Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.26,
                      color: Theme.of(context).accentColor,
                    ),
                    Container(
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
                // The card widget with top padding,
                // incase if you wanted bottom padding to work,
                // set the `alignment` of container to Alignment.bottomCenter
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .04,
                          right: 20.0,
                          left: 20.0),
                      child: new Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: Colors.white,
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                      './images/profile_placeholder.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '60 Verifications Completed',
                                    style: subHeader,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'N',
                                        style: header,
                                      ),
                                      Text(
                                        '3000',
                                        style: header,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Column(
                          children: [
                            TextField(
                              cursorColor: Color(0xFFFFC548),
                              style: text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'User\'s Name',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Column(
                          children: [
                            TextField(
                              cursorColor: Color(0xFFFFC548),
                              style: text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Bank',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Column(
                          children: [
                            TextField(
                              cursorColor: Color(0xFFFFC548),
                              style: text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Account Number',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            TextField(
                              cursorColor: Color(0xFFFFC548),
                              style: text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Amount',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Cash Out",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class d extends StatefulWidget {
  @override
  _dState createState() => _dState();
}

class _dState extends State<d> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('./images/profile_placeholder.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '60 Verifications Completed',
                            style: subHeader,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'N',
                                style: header,
                              ),
                              Text(
                                '3000',
                                style: header,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          cursorColor: Color(0xFFFFC548),
                          style: text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User\'s Name',
                          ),
                        ),
                        TextField(
                          cursorColor: Color(0xFFFFC548),
                          style: text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Bank',
                          ),
                        ),
                        TextField(
                          cursorColor: Color(0xFFFFC548),
                          style: text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Account Number',
                          ),
                        ),
                        TextField(
                          cursorColor: Color(0xFFFFC548),
                          style: text,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Amount',
                          ),
                        ),
                      ],
                    ),
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
