import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techpos_track/providers/sales_stats.dart';

class SalesLineChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SalesLineChartState();
}

class SalesLineChartState extends State<SalesLineChart> {
  bool isShowingMainData;

  static const List<Color> lineColors = [
    const Color.fromRGBO(255, 43, 83, 1),
    const Color.fromRGBO(87, 84, 213, 1),
    const Color.fromRGBO(79, 227, 193, 1),
    const Color.fromRGBO(255, 139, 2, 1),
  ];

  // final List<Map<String, dynamic>> salesPerMonth = [
  //   {
  //     'month': 'January',
  //     'sales': [
  //       {
  //         'dayNumber': 1,
  //         'dayName': 'Monday',
  //         'quantity': 210,
  //       },
  //       {
  //         'dayNumber': 2,
  //         'dayName': 'Tuesday',
  //         'quantity': 500,
  //       },
  //       {
  //         'dayNumber': 3,
  //         'dayName': 'Thursday',
  //         'quantity': 400,
  //       },
  //       {
  //         'dayNumber': 4,
  //         'dayName': 'Friday',
  //         'quantity': 400,
  //       },
  //     ]
  //   },
  //   {
  //     'month': 'February',
  //     'sales': [
  //       {
  //         'dayNumber': 1,
  //         'dayName': 'Monday',
  //         'quantity': 430,
  //       },
  //       {
  //         'dayNumber': 2,
  //         'dayName': 'Tuesday',
  //         'quantity': 230,
  //       },
  //       {
  //         'dayNumber': 3,
  //         'dayName': 'Thursday',
  //         'quantity': 430,
  //       },
  //     ]
  //   },
  //   {
  //     'month': 'March',
  //     'sales': [
  //       {
  //         'dayNumber': 1,
  //         'dayName': 'Monday',
  //         'quantity': 540,
  //       },
  //       {
  //         'dayNumber': 2,
  //         'dayName': 'Tuesday',
  //         'quantity': 320,
  //       },
  //       {
  //         'dayNumber': 3,
  //         'dayName': 'Thursday',
  //         'quantity': 380,
  //       },
  //     ]
  //   },
  // ];

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    final filteredMonths =
        Provider.of<StatsData>(context).filteredSalesPerMonth;

    final int nMonths = Provider.of<StatsData>(context).selectedMonths.length;

    return Container(
      margin: EdgeInsets.only(left: 20,),
      padding: EdgeInsets.only(
        right: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.black.withOpacity(0.02),
      ),
      height: 400,
      width: Provider.of<StatsData>(context).maxDaysSelected * 90.0,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              const Text(
                '',
                style: TextStyle(
                  color: Color(0xff827daa),
                  fontSize: 0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 0,
              ),
              const SizedBox(
                height: 0,
              ),
              Expanded(
                child: LineChart(
                  sampleData1(),
                  swapAnimationDuration: const Duration(milliseconds: 250),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.refresh,
          //     color: Colors.black.withOpacity(isShowingMainData ? 1.0 : 0.5),
          //   ),
          //   onPressed: () {
          //     setState(() {
          //       // isShowingMainData = !isShowingMainData;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              FlLine(color: Colors.black12, strokeWidth: 4),
              FlDotData(
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 6,
                    color: Colors.black12,
                    strokeWidth: 0,
                    strokeColor: Colors.black12,
                  );
                },
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              if (flSpot.x == 0) {
                return null;
              }

              return LineTooltipItem(
                '\$${barSpot.y}',
                TextStyle(
                  color: lineColors[barSpot.barIndex],
                  fontFamily: 'Sens',
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
          tooltipBgColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
        horizontalInterval: 50,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.bold,
            fontFamily: 'Sens',
            fontSize: 14,
          ),
          margin: 10,
          getTitles: (value) {
            if (value != 0) {
              return 'Día ${value.floor()}';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          interval: 100,
          showTitles: true,
          textStyle: const TextStyle(
            fontFamily: 'Sens',
            color: Colors.black45,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            return '\$${value.floor()}';
          },
          margin: 10,
          reservedSize: 40,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
          left: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
          right: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: Provider.of<StatsData>(context).maxDaysSelected.toDouble(),
      maxY: Provider.of<StatsData>(context).maxSalesOfSelectedMonths,
      // maxX: salesPerMonth.fold(0, (previousValue, monthElementh) {
      //   double maxCurrentMonth =
      //       (monthElementh['sales'] as List<Map<String, dynamic>>).fold(0,
      //               (previousValue, dayElement) {
      //             if (dayElement['dayNumber'] > previousValue) {
      //               return dayElement['dayNumber'].toDouble();
      //             } else {
      //               return previousValue;
      //             }
      //           }) +
      //           0.5;

      //   if (maxCurrentMonth > previousValue) {
      //     return maxCurrentMonth;
      //   } else {
      //     return previousValue;
      //   }
      // }),
      // maxY: salesPerMonth.fold(0, (previousValue, monthElementh) {
      //   double maxCurrentMonth =
      //       (monthElementh['sales'] as List<Map<String, dynamic>>).fold(0,
      //           (previousValue, dayElement) {
      //     if (dayElement['quantity'] > previousValue) {
      //       return dayElement['quantity'].toDouble();
      //     } else {
      //       return previousValue;
      //     }
      //   });

      //   if (maxCurrentMonth > previousValue) {
      //     return maxCurrentMonth;
      //   } else {
      //     return previousValue;
      //   }
      // }),
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    List<LineChartBarData> aa = [];
    int nColor = 0;

    Provider.of<StatsData>(context)
        .filteredSalesPerMonth
        .entries
        .map((e) {
          return (e.value as Map).entries.map((e) {
            print(nColor);
            nColor++;
            return LineChartBarData(
              spots: [
                FlSpot(0, 0),
                ...(e.value as Map)
                    .entries
                    .map((e) => FlSpot((e.key as int).toDouble(), e.value))
                    .toList(),
              ],
              isCurved: false,
              colors: [lineColors[nColor - 1]],
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    print('${index} $nColor');
                    if (spot.x == 0) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: Colors.transparent,
                        strokeWidth: 0,
                        strokeColor: Colors.transparent,
                      );
                    } else {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: barData.colors[0],
                        strokeWidth: 0,
                        strokeColor: barData.colors[0],
                      );
                    }
                  }),
              shadow: Shadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(2, 4),
                blurRadius: 5,
              ),
              belowBarData: BarAreaData(
                show: false,
              ),
            );
          }).toList();
        })
        .toList()
        .forEach((element) {
          element.forEach((e) {
            aa.add(e);
          });
        });
    return aa;

    // print(
    //     'BBBBBBBBBBBBBBBBBBB ${Provider.of<StatsData>(context).filteredSalesPerMonth.entries.map((e) {
    //   print("${(e.value as Map).entries}");
    // })}');
    // return salesPerMonth.asMap().entries.map((element) {
    //   print(element.value['sales']);
    //   return LineChartBarData(
    //     spots: [
    //       FlSpot(
    //           0,
    //           (element.value['sales'] as List<Map<String, dynamic>>)
    //               .asMap()
    //               .entries
    //               .elementAt(0)
    //               .value['quantity']
    //               .toDouble()),
    //       ...(element.value['sales'] as List<Map<String, dynamic>>)
    //           .asMap()
    //           .entries
    //           .map((entry) => FlSpot(entry.value['dayNumber'].toDouble(),
    //               entry.value['quantity'].toDouble()))
    //           .toList()
    //     ],
    // isCurved: false,
    // colors: [lineColors[element.key]],
    // barWidth: 4,
    // isStrokeCapRound: true,
    // dotData: FlDotData(
    //     show: true,
    //     getDotPainter: (spot, percent, barData, index) {
    //       if (spot.x == 0) {
    //         return FlDotCirclePainter(
    //           radius: 6,
    //           color: Colors.transparent,
    //           strokeWidth: 0,
    //           strokeColor: Colors.transparent,
    //         );
    //       } else {
    //         return FlDotCirclePainter(
    //           radius: 4,
    //           color: lineColors[element.key],
    //           strokeWidth: 0,
    //           strokeColor: lineColors[element.key],
    //         );
    //       }
    //     }),
    // shadow: Shadow(
    //   color: Colors.black.withOpacity(0.1),
    //   offset: Offset(2, 4),
    //   blurRadius: 5,
    // ),
    // belowBarData: BarAreaData(
    //   show: false,
    // ),
    //   );
    // }).toList();

    // final LineChartBarData lineChartBarData1 = LineChartBarData(
    // spots: [
    //   FlSpot(0, 1),
    //   FlSpot(1, 1.5),
    //   FlSpot(2, 1.4),
    //   FlSpot(3, 3.4),
    //   FlSpot(10, 2),
    //   FlSpot(12, 2.2),
    //   FlSpot(14, 1.8),
    // ],
    //   isCurved: true,
    //   colors: [
    //     const Color.fromRGBO(255, 43, 83, 1),
    //   ],
    //   barWidth: 4,
    //   isStrokeCapRound: true,
    //   dotData: FlDotData(
    //     show: false,
    //   ),
    //   shadow: Shadow(
    //     color: Colors.black.withOpacity(0.1),
    //     offset: Offset(2, 4),
    //     blurRadius: 5,
    //   ),
    //   belowBarData: BarAreaData(
    //     show: false,
    //   ),
    // );
    // final LineChartBarData lineChartBarData2 = LineChartBarData(
    //   shadow: Shadow(
    //     color: Colors.black.withOpacity(0.1),
    //     offset: Offset(2, 4),
    //     blurRadius: 5,
    //   ),
    //   spots: [
    //     FlSpot(0, 1),
    //     FlSpot(1, 2.8),
    //     FlSpot(2, 1.2),
    //     FlSpot(3, 2.8),
    //     FlSpot(12, 2.6),
    //     FlSpot(14, 3.9),
    //   ],
    //   isCurved: true,
    //   colors: [
    //     const Color.fromRGBO(79, 227, 193, 1),
    //   ],
    //   barWidth: 4,
    //   isStrokeCapRound: true,
    //   dotData: FlDotData(
    //     show: false,
    //   ),
    //   belowBarData: BarAreaData(show: false, colors: [
    //     const Color(0x00aa4cfc),
    //   ]),
    // );
    // final LineChartBarData lineChartBarData3 = LineChartBarData(
    //   shadow: Shadow(
    //     color: Colors.black.withOpacity(0.1),
    //     offset: Offset(2, 4),
    //     blurRadius: 5,
    //   ),
    //   spots: [
    //     FlSpot(0, 2.8),
    //     FlSpot(1, 1.9),
    //     FlSpot(2, 3),
    //     FlSpot(3, 1.3),
    //     FlSpot(14, 2.5),
    //   ],
    //   isCurved: true,
    //   colors: const [
    //     Color(0xff27b6fc),
    //   ],
    //   barWidth: 4,
    //   isStrokeCapRound: true,
    //   dotData: FlDotData(
    //     show: false,
    //   ),
    //   belowBarData: BarAreaData(
    //     show: false,
    //   ),
    // );
    // return [
    //   lineChartBarData1,
    //   lineChartBarData2,
    //   lineChartBarData3,
    // ];
  }

  LineChartData sampleData2() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '1';
              case 7:
                return '2';
              case 12:
                return '3';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
              case 5:
                return '6m';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
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
          )),
      minX: 0,
      maxX: 14,
      maxY: 6,
      minY: 0,
      lineBarsData: linesBarData2(),
    );
  }

  List<LineChartBarData> linesBarData2() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: const [
          Color(0x444af699),
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
        isCurved: true,
        colors: const [
          Color(0x99aa4cfc),
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          const Color(0x33aa4cfc),
        ]),
      ),
      LineChartBarData(
        spots: [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: const [
          Color(0x4427b6fc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }
}
