import 'package:avs/presentation/screens/dash_board_screen.dart';
import 'package:avs/presentation/widgets/bar_chart.dart';
import 'package:avs/presentation/widgets/request_count_card.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final space = SizedBox(
    height: 30,
  );

  @override
  Widget build(BuildContext context) {
    return DashBoardScreen();
  }
}
