import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:provider/provider.dart';
import 'package:techpos_track/providers/sales_stats.dart';
import 'package:techpos_track/widgets/sales_widget.dart';

import '../widgets/chips_select.dart';
import '../widgets/chips_select_day.dart';

import '../widgets/pie_chart_stats.dart';
import '../widgets/sales_line_chart.dart';
import '../widgets/period_type_picker.dart';
import '../widgets/stats_carrousel.dart';
import '../widgets/users_sales_chart.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = '/CategoryScreen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String showDays = 'months';

  void setFilter(String filter) {
    setState(() {
      showDays = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String categoryTitle =
        ModalRoute.of(context).settings.arguments as String;
    final deviceWidth = MediaQuery.of(context).size.width;

    Map<String, int> _nMaxSelectedChips = {
      'Ventas': 3,
      'Productos': 1,
    };

    Map<String, Map<String, Widget>> _chipsDates = {
      'Ventas': {
        'perMonths': Column(
          children: [
            Container(
              width: deviceWidth,
              padding: EdgeInsets.symmetric(horizontal: 0),
              // color: Colors.black.withOpacity(0.05),
              child: MonthChips(
                nMaxChips: _nMaxSelectedChips[categoryTitle],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      },
      'Productos': {
        'perMonths': Column(
          children: [
            Container(
              width: deviceWidth,
              padding: EdgeInsets.symmetric(horizontal: 0),
              // color: Colors.black.withOpacity(0.05),
              child: MonthChips(
                nMaxChips: _nMaxSelectedChips[categoryTitle],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Divider(),
            Provider.of<StatsData>(context).selectedMonths.isEmpty
                ? Container()
                : SelectDaysChip(),
          ],
        )
      },
      'Empleados': {
        'perMonths': Container(),
      },
      'Horas': {
        'perMonths': Container(),
      },
      'Órdenes': {
        'perMonths': Container(),
      },
    };

    Map<String, Widget> _graphWidget = {
      'empty': Center(
        child: Icon(Icons.insert_chart),
      ),
      'Ventas': SalesWidget(),
      'Empleados': UserSalesChart(),
      'Productos': Container(
        width: deviceWidth,

        child: PieChartStats(),
        // height: 500,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        // decoration: BoxDecoration(
        //   color: Color.fromARGB(255, 250, 250, 250),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Theme.of(context).primaryColor.withOpacity(0.05),
        //       spreadRadius: 0,
        //       blurRadius: 1,
        //       offset: Offset(0, 2), // changes position of shadow
        //     ),
        //   ],
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
      'Horas': Container(),
      'Órdenes': Container(),
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text(
        //   'Ventas',
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 16,
        //   ),
        // ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Provider.of<StatsData>(
                context,
                listen: false,
              ).clearMonths();
              Provider.of<StatsData>(
                context,
                listen: false,
              ).setSalesStatsDate(year: '${DateTime.now().year}');
            }),
        backgroundColor: Colors.white,
        elevation: 0,
        // elevation: 1,
        // actions: [PeriodTypePicker()],
        // shadowColor: Colors.black45,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: deviceWidth,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Text(
                    categoryTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 28,
                    ),
                  ),
                  Spacer(),
                  // PeriodTypePicker(),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Container(
            //   width: deviceWidth,
            //   padding: EdgeInsets.symmetric(horizontal: 0),
            //   // color: Colors.black.withOpacity(0.05),
            //   child: MonthChips(
            //     nMaxChips: _nMaxSelectedChips[categoryTitle],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // // Divider(),
            // Provider.of<StatsData>(context).selectedMonths.isEmpty
            //     ? Container()
            //     : SelectDaysChip(),
            _chipsDates[categoryTitle]['perMonths'],
            SizedBox(
              height: 20,
            ),
            Provider.of<StatsData>(context).selectedMonths.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Center(
                          child: Icon(
                            Icons.insert_chart,
                            size: 100,
                            color: Colors.black.withOpacity(0.05),
                          ),
                        ),
                      ),
                    ],
                  )
                : _graphWidget[categoryTitle]
          ]),
        ),
      ),
    );
  }
}
