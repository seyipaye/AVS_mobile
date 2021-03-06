import 'package:avs/presentation/pages/request/new_request_page.dart';
import 'package:avs/presentation/pages/request/assigned_request_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen();

  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final Map<int, Widget> tabs = <int, Widget>{
    0: Container(
      width: double.maxFinite,
      child: Center(child: Text('Assigned')),
    ),
    1: Container(
      width: double.maxFinite,
      child: Center(child: Text('New')),
    ),
  };

  final Map<int, Widget> children = <int, Widget>{
    0: AssignedRequestPage(),
    1: NewRequestPage(),
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CupertinoSegmentedControl(
              children: tabs,
              groupValue: selectedIndex,
              padding: EdgeInsets.all(20), // padding added now.
              onValueChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
            Expanded(child: children[selectedIndex])
          ],
        ),
      ),
    );
  }
}
