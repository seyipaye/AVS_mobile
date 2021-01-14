import 'package:avs/presentation/widgets/bar_chart_group_data.dart';
import 'package:avs/presentation/widgets/bar_chart_key.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarChart(
          BarChartData(
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) =>
                    const TextStyle(color: Color(0xff939393), fontSize: 10),
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Jan';
                    case 1:
                      return 'Feb';
                    case 2:
                      return 'Mar';
                    case 3:
                      return 'Apr';
                    case 4:
                      return 'May';
                    case 5:
                      return 'Jun';
                    case 6:
                      return 'July';
                    case 7:
                      return 'Aug';
                    case 8:
                      return 'Sept';
                    case 9:
                      return 'Oct';
                    case 10:
                      return 'Nov';
                    case 11:
                      return 'Dec';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                    color: Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
                margin: 10,
                reservedSize: 14,
                getTitles: (value) {
                  if (value == 0) {
                    return '0';
                  } else if (value == 20) {
                    return '20';
                  } else if (value == 40) {
                    return '40';
                  } else if (value == 60) {
                    return '60';
                  } else if (value == 80) {
                    return '80';
                  } else if (value == 100) {
                    return '100';
                  } else if (value == 120) {
                    return '120';
                  } else if (value == 140) {
                    return '140';
                  } else {
                    return '';
                  }
                },
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            groupsSpace: 1,
            barGroups: [
              groupData(
                  position: 0,
                  width: 4,
                  approved: 30,
                  pending: 40,
                  rejected: 20),
              groupData(
                  position: 1,
                  width: 4,
                  approved: 10,
                  pending: 40,
                  rejected: 20),
              groupData(
                  position: 2,
                  width: 4,
                  approved: 30,
                  pending: 10,
                  rejected: 20),
              groupData(
                  position: 3,
                  width: 4,
                  approved: 40,
                  pending: 40,
                  rejected: 10),
              groupData(
                  position: 4,
                  width: 4,
                  approved: 20,
                  pending: 20,
                  rejected: 40),
              groupData(
                  position: 5,
                  width: 4,
                  approved: 30,
                  pending: 10,
                  rejected: 10),
              groupData(
                  position: 6,
                  width: 4,
                  approved: 30,
                  pending: 50,
                  rejected: 5),
              groupData(
                  position: 7,
                  width: 4,
                  approved: 20,
                  pending: 40,
                  rejected: 30),
              groupData(
                  position: 8,
                  width: 4,
                  approved: 10,
                  pending: 10,
                  rejected: 20),
              groupData(
                  position: 9,
                  width: 4,
                  approved: 30,
                  pending: 30,
                  rejected: 20),
              groupData(
                  position: 10,
                  width: 4,
                  approved: 30,
                  pending: 30,
                  rejected: 30),
              groupData(
                  position: 11,
                  width: 4,
                  approved: 10,
                  pending: 40,
                  rejected: 20),
            ],
          ),
        ),
        BarChartKey(
          keys: [
            KeyItem(
              color: Color(0xFF6CF6BD),
              title: 'Approved',
            ),
            KeyItem(
              color: Color(0xFFFFE57F),
              title: 'Pending',
            ),
            KeyItem(
              color: Color(0xFFFF0100),
              title: 'Rejected',
            )
          ],
        ),
      ],
    );
  }
}
