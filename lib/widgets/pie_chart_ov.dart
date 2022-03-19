import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techpos_track/providers/sales_stats.dart';

class PieChart2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex;

  final List<Map<String, dynamic>> statsPerDay = [
    {
      'day': 'Item 1',
      'nTickets': 50,
    },
    {
      'day': 'Item 2',
      'nTickets': 22,
    },
    {
      'day': 'Item 3',
      'nTickets': 15,
    },
    {
      'day': 'Otros',
      'nTickets': 35,
    },
  ];

  final List<Color> chartColor = [
    Colors.white,
    Colors.white70,
    Colors.white60,
    Colors.white38,
    // Color(0xff0293ee),
    // Color(0xfff8b250),
    // Color(0xff845bef),
    // Color(0xff13d38e),
  ];

  List<PieChartSectionData> showingSections() {
    final int totalTickets = statsPerDay.fold(0, (previousValue, element) {
      return previousValue + element['nTickets'];
    });

    return statsPerDay.asMap().entries.map((entry) {
      final isTouched = entry.key == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;

      return PieChartSectionData(
        color: chartColor.elementAt(entry.key),
        showTitle: false,
        value: entry.value['nTickets'] / totalTickets,
        title:
            '${((entry.value['nTickets'] / totalTickets) * 100).truncate()}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Sens',
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {



    return LayoutBuilder(builder: (context, parentConstraints) {
      return Column(
        children: [
          Spacer(),
          Row(
            children: [
              Spacer(),
              Container(
                // color: Colors.black,
                width: parentConstraints.maxWidth * 0.6,
                height: parentConstraints.maxHeight * 0.6,
                child: FittedBox(
                  child: PieChart(
                    PieChartData(
                        pieTouchData:
                            PieTouchData(touchCallback: (pieTouchResponse) {
                          setState(() {
                            if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                pieTouchResponse.touchInput is FlPanEnd) {
                              touchedIndex = -1;
                            } else {
                              touchedIndex =
                                  pieTouchResponse.touchedSectionIndex;
                            }
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 80,
                        sections: showingSections()),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
