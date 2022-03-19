import 'package:flutter/material.dart';
import 'package:techpos_track/widgets/sales_line_chart.dart';
import 'package:techpos_track/widgets/stats_carrousel.dart';

class SalesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatsCarrousel(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SalesLineChart(),
        ),
      ],
    );
  }
}
