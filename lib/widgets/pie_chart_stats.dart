import 'dart:collection';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techpos_track/providers/sales_stats.dart';

class PieChartStats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartStatsState();
}

class PieChartStatsState extends State<PieChartStats> {
  bool isHightoLow = true;
  int touchedIndex;

  final List<Map<String, dynamic>> statsPerDay = [
    {
      'product': 'Taquiza',
      'nTickets': 50,
    },
    {
      'product': 'Burrito',
      'nTickets': 22,
    },
    {
      'product': 'Tacos al pastor',
      'nTickets': 15,
    },
    {
      'product': 'Sopa de tortilla',
      'nTickets': 35,
    },
    {
      'product': 'Sopa de tortilla',
      'nTickets': 35,
    },
    {
      'product': 'Sopa de tortilla',
      'nTickets': 35,
    },
    {
      'product': 'Sopa de tortilla',
      'nTickets': 35,
    },
  ];

  void orderProducts() {
    setState(() {
      if (isHightoLow) {
        isHightoLow = false;
        statsPerDay.sort((a, b) {
          return (a['nTickets'] as int).compareTo((b['nTickets'] as int));
        });
      } else {
        isHightoLow = true;
        statsPerDay.sort((a, b) {
          return (b['nTickets'] as int).compareTo((a['nTickets'] as int));
        });
      }
    });
  }

  final List<Color> chartColor = [
    const Color.fromRGBO(255, 43, 83, 1),
    const Color.fromRGBO(87, 84, 213, 1),
    const Color.fromRGBO(79, 227, 193, 1),
    const Color.fromRGBO(255, 139, 2, 1),
    const Color.fromRGBO(255, 43, 83, 1),
    const Color.fromRGBO(87, 84, 213, 1),
    const Color.fromRGBO(79, 227, 193, 1),
    const Color.fromRGBO(255, 139, 2, 1),
    const Color.fromRGBO(255, 43, 83, 1),
    const Color.fromRGBO(87, 84, 213, 1),
    const Color.fromRGBO(79, 227, 193, 1),
    const Color.fromRGBO(255, 139, 2, 1),
  ];

  List<PieChartSectionData> showingSections() {
    final int totalTickets = statsPerDay.fold(0, (previousValue, element) {
      return previousValue + element['nTickets'];
    });

    return statsPerDay.asMap().entries.map((entry) {
      final isTouched = entry.key == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 80 : 70;

      return PieChartSectionData(
        color: chartColor.elementAt(entry.key),
        showTitle: true,
        value: entry.value['nTickets'] / totalTickets,
        title:
            '${((entry.value['nTickets'] / totalTickets) * 100).truncate()}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          shadows: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          fontFamily: 'Sens',
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    
    int selectedYear =
        int.parse(Provider.of<StatsData>(context, listen: false).selectedMonths[0].year);
    int selectedMonth =
        int.parse(Provider.of<StatsData>(context, listen: false).selectedMonths[0].month);
    int selectedDay = Provider.of<StatsData>(context, listen: false).selectedMonths[0].day;

    // Map<String, int> products =
    //     Provider.of<StatsData>(context, listen: false).filteredProductsStats;

    // print('*********++PRODUCTOSSSSSS*************** : $products');

    print("AÑO $selectedYear, MES $selectedMonth, DIA $selectedDay ");
    return LayoutBuilder(builder: (context, parentConstraints) {
      return Column(
        children: [
          Container(
            // color: Colors.black,
            width: parentConstraints.maxWidth * 0.8,

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
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
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
          SizedBox(height: 50),
          Row(
            children: [
              Spacer(),
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: orderProducts,
                child: Row(
                  children: [
                    isHightoLow
                        ? Icon(EvaIcons.arrowDown)
                        : Icon(EvaIcons.arrowUp),
                    Text('Ventas')
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              ...statsPerDay.asMap().entries.map((entry) {
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 16,
                          ),
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: chartColor[entry.key],
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        Container(
                          width: parentConstraints.maxWidth * 0.55,
                          child: Text(
                            entry.value['product'],
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            softWrap: true,
                          ),
                        ),
                        Spacer(),
                        Text(
                          entry.value['nTickets'].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                      // color: chartColor.elementAt(entry.key),
                      // showTitle: true,
                      // value: entry.value['nTickets'] / totalTickets,
                      // title:
                      //     '${((entry.value['nTickets'] / totalTickets) * 100).truncate()}%',
                      // radius: radius,
                      // titleStyle: TextStyle(
                      //   fontSize: fontSize,
                      //   shadows: [
                      //     BoxShadow(
                      //       color: Theme.of(context).primaryColor.withOpacity(0.1),
                      //       spreadRadius: 0,
                      //       blurRadius: 1,
                      //       offset: Offset(0, 3), // changes position of shadow
                      //     ),
                      //   ],
                      //   fontFamily: 'Sens',
                      //   fontWeight: FontWeight.bold,
                      //   color: const Color(0xffffffff),
                      // ),
                    ),
                  ),
                  Divider(),
                ]);
              }),
            ],
          )
        ],
      );
    });
  }
}
