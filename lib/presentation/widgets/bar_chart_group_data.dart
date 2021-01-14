import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

BarChartGroupData groupData(
    {@required int position,
    @required double width,
    @required double approved,
    @required double pending,
    @required double rejected}) {
  double total = approved + pending + rejected;
  return BarChartGroupData(x: position, barRods: [
    BarChartRodData(
        width: 4,
        y: total,
        rodStackItems: [
          BarChartRodStackItem(0, approved, Color(0xFF6CF6BD)),
          BarChartRodStackItem(approved, approved + pending, Color(0xFFFFE57F)),
          BarChartRodStackItem(approved + pending, total, Color(0xFFFF0100)),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5))),
  ]);
}
