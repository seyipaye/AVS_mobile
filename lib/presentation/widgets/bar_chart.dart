import 'package:avs/presentation/widgets/bar_chart_group_data.dart';
import 'package:avs/presentation/widgets/bar_chart_key.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  final List<BarChartGroupData> list;

  const MyBarChart({@required this.list});

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
            barGroups: list,
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
