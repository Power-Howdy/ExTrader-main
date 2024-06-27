import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LineChartSample9 extends StatelessWidget {
  final List<double> chartBidData;
  final List<double> chartAskData;
  final high;
  final low;

  LineChartSample9(
      {Key? key,
      required this.chartBidData,
      required this.chartAskData,
      required this.high,
      required this.low})
      : super(key: key);

  List<FlSpot> get spots => chartBidData
      .asMap()
      .entries
      .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
      .toList();
  List<FlSpot> get spots2 => chartAskData.asMap().entries.map((entry) {
        // Truncate to 5 decimal places directly
        double x = double.parse(entry.key.toStringAsFixed(5));
        double y = double.parse(entry.value.toStringAsFixed(5));
        return FlSpot(x, y);
      }).toList();

  Widget rightTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final style = TextStyle(
      color: Colors.yellow, // Adjust color as needed
      fontWeight: FontWeight.bold,
      fontSize: 10, // Set font size to 10
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(meta.formattedValue, style: style),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    if (value % 1 != 0) {
      return Container();
    }
    final style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(meta.formattedValue, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final style = TextStyle(
      color: Colors.yellow,
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(meta.formattedValue, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        bottom: 12,
        right: 0,
        top: 20,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    maxContentWidth: 100,
                    tooltipBgColor: Colors.black,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((LineBarSpot touchedSpot) {
                        final textStyle = TextStyle(
                          color: touchedSpot.bar.gradient?.colors[0] ??
                              touchedSpot.bar.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        );
                        return LineTooltipItem(
                          '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(5)}',
                          textStyle,
                        );
                      }).toList();
                    },
                  ),
                  handleBuiltInTouches: true,
                  getTouchLineStart: (data, index) => 0,
                ),
                lineBarsData: [
                  // First line (Blue)
                  LineChartBarData(
                    color: Colors.blue,
                    spots: spots,
                    isCurved: true,
                    isStrokeCapRound: true,
                    barWidth: 1,
                    belowBarData: BarAreaData(show: false),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        // Check if this is the last spot
                        if (index == spots.length - 1) {
                          return FlDotCirclePainter(
                            radius: 6, // Size of the dot
                            color: Colors.blue,
                            strokeWidth: 1,
                            strokeColor: Colors.white,
                          );
                        } else {
                          return FlDotCirclePainter(
                            radius: 0, // Hide other dots
                          );
                        }
                      },
                    ),
                    // Additional settings for the line
                  ),
                  // Second line (Red)
                  LineChartBarData(
                    color: Colors.red, // Color for the second line
                    spots: spots2,
                    isCurved: true,
                    isStrokeCapRound: true,
                    barWidth: 1,
                    belowBarData: BarAreaData(show: false),
                    dotData: const FlDotData(show: false),
                  ),
                ],
                minY: chartBidData.last,
                maxY: chartAskData.last,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles:
                        SideTitles(showTitles: false), // Disable bottom titles
                  ),
                  leftTitles: AxisTitles(
                    sideTitles:
                        SideTitles(showTitles: false), // Disable left titles
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) =>
                          rightTitleWidgets(value, meta, constraints.maxWidth),
                      reservedSize: 56,
                    ),
                    drawBelowEverything: true,
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  horizontalInterval: 0.01,
                  verticalInterval: 1,
                  checkToShowHorizontalLine: (value) {
                    return value.toInt() == 0;
                  },
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: Colors.blue.withOpacity(1),
                    dashArray: [8, 2],
                    strokeWidth: 0.8,
                  ),
                  getDrawingVerticalLine: (_) => FlLine(
                    color: Colors.yellow.withOpacity(1),
                    dashArray: [8, 2],
                    strokeWidth: 0.8,
                  ),
                  checkToShowVerticalLine: (value) {
                    return value.toInt() == 0;
                  },
                ),
                borderData: FlBorderData(show: false),
              ),
            );
          },
        ),
      ),
    );
  }
}
