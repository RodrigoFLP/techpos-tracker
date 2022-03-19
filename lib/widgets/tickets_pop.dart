import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../widgets/line_chart_ov.dart';

class TicketsPop extends StatelessWidget {
  const TicketsPop({
    Key key,
    @required this.onTap,
    @required this.boxColors,
  }) : super(key: key);

  final Function onTap;
  final List<Color> boxColors;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 21 / 20,
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 20,
          top: 10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(24),
            onTap: onTap,
            child: Ink(
              // padding: EdgeInsets.all(16),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Spacer(),
                      AspectRatio(
                        aspectRatio: 4 / 2,
                        child: LineChartOv(
                          statsPerDay: [
                            {
                              'day': 'L',
                              'total': 10.0,
                            },
                            {
                              'day': 'M',
                              'total': 21.0,
                            },
                            {
                              'day': 'M',
                              'total': 14.0,
                            },
                            {
                              'day': 'J',
                              'total': 22.0,
                            },
                            {
                              'day': 'V',
                              'total': 25.0,
                            },
                          ],
                          showTitlesX: false,
                          gradientColors: [
                            Colors.white,
                            Colors.white,
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Spacer(),
                        AspectRatio(
                          aspectRatio: 10 / 40,
                          child: FittedBox(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                EvaIcons.shoppingCart,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 36 / 1,
                          child: SizedBox(),
                        ),
                        AspectRatio(
                          aspectRatio: 14 / 2,
                          child: FittedBox(
                            // fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Órdenes',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 10 / 1,
                          child: SizedBox(),
                        ),
                        AspectRatio(
                          aspectRatio: 10 / 2,
                          child: FittedBox(
                            // fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '534',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 15 / 2,
                          child: FittedBox(
                            // fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'tickets',
                              style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // margin: EdgeInsets.only(
              //   left: 20,
              //   right: 10,
              //   bottom: 10,
              // ),
              decoration: BoxDecoration(
                  color: boxColors[3], borderRadius: BorderRadius.circular(24)),
            ),
          ),
        ),
      ),
    );
  }
}
