import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartOv extends StatelessWidget {
  final List statsPerDay;

  final List<Color> gradientColors;

  final bool showTitlesX;

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: showTitlesX,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: (22 / 6) * statsPerDay.length,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 14),
          getTitles: (value) {
            return statsPerDay.elementAt(value.toInt())['day'];
          },
          margin: 6,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: showTitlesX,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 2,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: statsPerDay.length.toDouble() - 1,
      minY: 0,
      maxY: statsPerDay.fold(0, (previousValue, element) {
        if (element['total'] > previousValue) {
          return element['total'];
        } else {
          return previousValue;
        }
      }),
      lineBarsData: [
        LineChartBarData(
          spots: statsPerDay
              .asMap()
              .entries
              .map(
                  (entry) => FlSpot(entry.key.toDouble(), entry.value['total']))
              .toList(),
          isCurved: false,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: showTitlesX,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartOv({this.statsPerDay, this.showTitlesX = true, this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return LineChart(mainData());
  }
}
