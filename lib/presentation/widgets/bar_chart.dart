import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
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
              }),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        groupsSpace: 1,
        barGroups: [
          BarChartGroupData(x: 0, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
                y: 100,
                rodStackItems: [
                  BarChartRodStackItem(0, 20, Colors.red),
                  BarChartRodStackItem(20, 50, Colors.yellow),
                  BarChartRodStackItem(50, 100, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 8, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 9, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 10, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
          BarChartGroupData(x: 11, barRods: [
            BarChartRodData(
                y: 60,
                rodStackItems: [
                  BarChartRodStackItem(0, 30, Colors.red),
                  BarChartRodStackItem(30, 50, Colors.yellow),
                  BarChartRodStackItem(50, 60, Colors.lightGreen),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ]),
        ],
      ),
    );
  }
}
