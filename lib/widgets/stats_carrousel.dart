import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:techpos_track/providers/sales_stats.dart';
import 'package:techpos_track/style/colors.dart';
import '../widgets/months_stats_container.dart';

class StatsCarrousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final generalStats =
        Provider.of<StatsData>(context).generalMonthSalesStats;
    final selectedMonths = Provider.of<StatsData>(context).selectedMonths;
    return LayoutBuilder(
      builder: (context, parentConstraints) => Container(
        width: parentConstraints.maxWidth,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            children: [
              ...selectedMonths.asMap().entries.map((e) {
                final maxSales =
                    generalStats['${e.value.year}']['${e.value.month}']['max'];
                final minSales =
                    generalStats['${e.value.year}']['${e.value.month}']['min'];
                final averageSales =
                    generalStats['${e.value.year}']['${e.value.month}']['prom'];
                final total = generalStats['${e.value.year}']
                    ['${e.value.month}']['total'];
                print('AAAAAAAAAAAAAMAX $maxSales');

                return MonthStatsContainer(
                  monthName: DateFormat.yMMM().format(DateTime.utc(
                      int.parse(e.value.year), int.parse(e.value.month))),
                  max: maxSales,
                  min: minSales,
                  average: averageSales,
                  total: total,
                  bgColor: AppColors.iterativeColors[e.key],
                );
              }),
              // MonthStatsContainer(
              //   monthName: 'Enero',
              //   max: 1000,
              //   min: 200,
              //   average: 500,
              //   total: 22044,
              //   bgColor: Color.fromRGBO(255, 43, 83, 1),
              // ),
              // MonthStatsContainer(
              //   monthName: 'Febrero',
              //   max: 1000,
              //   min: 200,
              //   average: 500,
              //   total: 22044,
              //   bgColor: Color.fromRGBO(87, 84, 213, 1),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
