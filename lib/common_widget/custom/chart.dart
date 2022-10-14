import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({
    required this.data,
    required this.minData,
    required this.maxData,
    this.minY,
    this.maxY,
    this.initialData,
    Key? key,
  }) : super(key: key);

  final List<double> data;
  final double minData;
  final double maxData;
  final double? minY;
  final double? maxY;
  final double? initialData;

  @override
  State<StatefulWidget> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  var dataAnimated = [];

  @override
  void initState() {
    super.initState();
    dataAnimated =
        List.filled(widget.data.length, widget.initialData ?? widget.minData);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: widget.data.length - 1,
          minY: widget.minY ?? widget.minData,
          maxY: widget.maxY ?? widget.maxData,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            // rightTitles: AxisTitles(
            //     sideTitles: SideTitles(
            //         reservedSize:
            //     )
            // )
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                for (int i = 0; i < widget.data.length; i++)
                  FlSpot(i.toDouble(), widget.data[i]),
              ],
              isCurved: true,
              barWidth: 3,
              isStrokeCapRound: true,
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment(0.9, -0.2),
                colors: [
                  Color(0x00FFFFFF)
                ],
              ),
            ),
          ],
        ),
        swapAnimationCurve: Curves.easeInOut,
        swapAnimationDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
