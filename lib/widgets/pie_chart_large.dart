import 'package:flutter/material.dart';
import '../widgets/pie_chart_ov.dart';

class PieChartLargeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
                aspectRatio: 4/6,
                child: Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          'TOP 3 PRODUCTOS SEMANA',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                        flex: 10,
                        child: PieChart2(),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 6), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              );
  }
}