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
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, getTitlesWidget: getBottomTitles),
          ),
        ),
        barGroups: myBarData.barData.map((data) {
          bool isGreater = false;
          if (data.y > 10) {
            isGreater = !isGreater;
          }
          return BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y,
                width: 25,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 100,
                  color: Colors.white70,
                ),
                borderRadius: BorderRadius.circular(5),
                color: isGreater ? Colors.red : Colors.green,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const txtStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text("S", style: txtStyle);
      break;
    case 2:
      text = Text("M", style: txtStyle);
      break;
    case 3:
      text = Text("T", style: txtStyle);
      break;
    case 4:
      text = Text("W", style: txtStyle);
      break;
    case 5:
      text = Text("T", style: txtStyle);
      break;
    case 6:
      text = Text("F", style: txtStyle);
      break;
    case 7:
      text = Text("S", style: txtStyle);
      break;
    default:
      text = Text("");
  }
  return text;
}
