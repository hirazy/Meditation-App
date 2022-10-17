import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  const Chart({
    required this.data,
    required this.minData,
    required this.maxData,
    this.minY,
    this.maxY,
    this.initialData,
    this.gradientColors = const [
      Color(0xFFFFFFFF),
      Color(0x00FFFFFF),
    ],
    this.horizontalLines = const [],
    this.format = '',
    this.thickness = 3,
    this.interval,
    this.showTouchTooltip = false,
    Key? key,
  }) : super(key: key);

  final List<double> data;
  final double minData;
  final double maxData;
  final double? minY;
  final double? maxY;
  final double? initialData;
  final double? interval;
  final List<Color> gradientColors;
  final List<String> horizontalLines;
  final String format;
  final double? thickness;
  final bool showTouchTooltip;

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
        swapAnimationCurve: Curves.easeInOut,
        swapAnimationDuration: const Duration(milliseconds: 1000),
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
          ),
          gridData: FlGridData(
            drawVerticalLine: false,
            drawHorizontalLine: widget.interval != null,
            horizontalInterval: widget.interval,
            getDrawingHorizontalLine: (_) => FlLine(
              color: Colors.black,
              strokeWidth: 0.5,
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineTouchData: LineTouchData(
            enabled: widget.showTouchTooltip,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.red,
              getTooltipItems: (touchedSpots) => touchedSpots
                  .map(
                    (spot) => LineTooltipItem(
                      '${NumberFormat.simpleCurrency().format(spot.y)}\n'
                      '${spot.x.toInt()}:00',
                      const TextStyle(),
                    ),
                  )
                  .toList(),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                for (int i = 0; i < widget.data.length; i++)
                  FlSpot(i.toDouble(), widget.data[i]),
              ],
              isCurved: true,
              barWidth: widget.thickness,
              isStrokeCapRound: true,
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment(0.9, -0.2),
                colors: [
                  Color(0x00FFFFFF),
                  Color(0xFFFFFFFF),
                ],
              ),
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.gradientColors,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
