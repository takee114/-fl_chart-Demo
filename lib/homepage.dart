import "package:flutter/material.dart";

import "bar_graph/bar_graph.dart";

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<double> weeklySummary = [20, 30, 10, 18.6, 4.9, 8, 40.5, 55, 24.2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(210, 206, 208, 209),
      body: Center(
        child: SizedBox(
          height: 200,
          child: MyBarGraph(
            weeklySummary: weeklySummary,
          ),
        ),
      ),
    );
  }
}
