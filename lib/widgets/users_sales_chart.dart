import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../style/colors.dart';

class UserSalesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              height: 400,
              width: double.infinity,
              child: HorizontalBarLabelChart.withSampleData()),
          // Row(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(
          //         left: 20,
          //       ),
          //       child: Align(
          //         alignment: Alignment.centerLeft,
          //         child: Text(
          //           'Nombre',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //       height: 60,
          //       width: 200,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(10),
          //           bottomRight: Radius.circular(10),
          //         ),
          //         color: Colors.redAccent,
          //       ),
          //     )
          //   ],
          // ),
          // Row(),
          // Row(),
        ],
      ),
    );
  }
}

class HorizontalBarLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarLabelChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HorizontalBarLabelChart.withSampleData() {
    return new HorizontalBarLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit and the
  // area outside of the bar is larger than the bar, it will draw outside of the
  // bar. Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      // behaviors: [
      //   new charts.DatumLegend(
      //     desiredMaxColumns: 2,

      //     entryTextStyle: charts.TextStyleSpec(
      //       color: charts.MaterialPalette.black,
      //       fontFamily: 'Sens',
      //       fontSize: 16,

      //     ),
      //   ),
      // ],
      animate: animate,
      vertical: false,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(
        insideLabelStyleSpec: charts.TextStyleSpec(
          color: charts.Color(
            a: 255,
            r: 255,
            g: 255,
            b: 255,
          ),
          fontFamily: 'Sens',
        ),
      ),
      // Hide domain axis.
      domainAxis: new charts.OrdinalAxisSpec(
        renderSpec: new charts.NoneRenderSpec(),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('Juan', 5),
      new OrdinalSales('Jose', 25),
      new OrdinalSales('Alfonso', 100),
      new OrdinalSales('Alfredo', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          colorFn: (datum, _) =>
              charts.Color.fromHex(code: '${AppColors.iterativeColorsHex}'),
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.year}: \$${sales.sales.toString()}')
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
