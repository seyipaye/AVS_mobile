import 'package:avs/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:avs/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReusableCard(
                  colour: activeCard,
                  cardChild: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            "./images/decore-left.png",
                            width: 100,
                          ),
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF030066),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.mapMarker,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            "./images/decore-right.png",
                            width: 100,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hi User',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'You currently have 0 verifications. See below for breakdown',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Total Requests Inprogress'),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Processing Requests: 50 %"),
                              SizedBox(
                                height: 10,
                              ),
                              LinearProgressIndicator(
                                backgroundColor: Color(0xFFFFF5EC),
                                value: 0.5,
                                valueColor: AlwaysStoppedAnimation(activeCard),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Unpaid Requests: 50 %"),
                              SizedBox(
                                height: 10,
                              ),
                              LinearProgressIndicator(
                                backgroundColor: Color(0xFFFFF5EC),
                                value: 0.5,
                                valueColor: AlwaysStoppedAnimation(activeCard),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Total Requests Inprogress'),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Processing Requests: 0 %"),
                              SizedBox(
                                height: 10,
                              ),
                              LinearProgressIndicator(
                                backgroundColor: Color(0xFFFFF5EC),
                                value: 0.0,
                                valueColor: AlwaysStoppedAnimation(activeCard),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Unpaid Requests: 5 %"),
                              SizedBox(
                                height: 10,
                              ),
                              LinearProgressIndicator(
                                backgroundColor: Color(0xFFFFF5EC),
                                value: 0.05,
                                valueColor: AlwaysStoppedAnimation(activeCard),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("You haven't created any verification request"),
                    Container(
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      color: Color(0xFFFFC548),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Create",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
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
    );
  }
}
