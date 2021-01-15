import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen();

  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final Map<int, Widget> children = const <int, Widget>{
    0: Center(
      child: FlutterLogo(
        textColor: Colors.indigo,
        style: FlutterLogoStyle.stacked,
        size: 200.0,
      ),
    ),
    1: Center(
      child: FlutterLogo(
        textColor: Colors.teal,
        style: FlutterLogoStyle.horizontal,
        size: 200.0,
      ),
    ),
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Map<int, Widget> tabs = <int, Widget>{
      0: Container(
        width: double.maxFinite,
        child: Center(child: Text('All')),
      ),
      1: Container(
        width: double.maxFinite,
        child: Center(child: Text('Assigned')),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: CupertinoSegmentedControl(
                children: tabs,
                groupValue: selectedIndex,
                padding: EdgeInsets.all(10), // padding added now.
                onValueChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(child: children[selectedIndex])
          ],
        ),
      ),
    );
  }
}
