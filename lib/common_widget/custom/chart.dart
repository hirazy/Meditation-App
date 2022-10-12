import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({
    required this.data,
    required this.minData,
    required this.maxData,
    required this.minY,
    required this.maxY,
    Key? key,
  }) : super(key: key);

  final List<double> data;
  final double minData;
  final double maxData;
  final double minY;
  final double maxY;

  @override
  State<StatefulWidget> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: LineChart(
        LineChartData(),
      ),
    );
  }
}
