import "package:chart_demo/bar_graph/bar_data.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";

class MyBarGraph extends StatelessWidget {
  final List<double> weeklySummary;
  MyBarGraph({super.key, required this.weeklySummary});
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thrAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[6],
    );
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
