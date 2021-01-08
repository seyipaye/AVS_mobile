import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Image(),
                    Text(
                      'AVS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'DASHBOARD',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Card(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          color: Color(0xFFD4DBF9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset("profile-img.png"),
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Welcome back!',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Username'),
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xFFF8F8FB),
                          ),
                          Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Usertype'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '3.9',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        CupertinoIcons.star_fill,
                                        size: 10,
                                        color: Color(0xFFFFA502),
                                      ),
                                      Icon(
                                        CupertinoIcons.star_fill,
                                        size: 10,
                                        color: Color(0xFFFFA502),
                                      ),
                                      Icon(
                                        CupertinoIcons.star_fill,
                                        size: 10,
                                        color: Color(0xFFFFA502),
                                      ),
                                      Icon(
                                        CupertinoIcons.star_fill,
                                        size: 10,
                                        color: Color(0xFFFFA502),
                                      ),
                                      Icon(
                                        CupertinoIcons.star_fill,
                                        size: 10,
                                        color: Color(0xFFFFA502),
                                      ),
                                    ],
                                  ),
                                  Text('Rating')
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NGN 0.00',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Wallet')
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Color(0xFF556EE6),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('ViewProfile'),
                                Icon(CupertinoIcons.arrow_right)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Earning'),
                        Text('This Month '),
                        Text('NGN 0.00'),
                        Row(
                          children: [
                            Text('0%'),
                            Icon(
                              CupertinoIcons.arrow_down,
                              color: Colors.red,
                            ),
                            Text('From previous period'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        value: 0.9,
                        strokeWidth: 10,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
