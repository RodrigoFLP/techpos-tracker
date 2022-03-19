import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart' as intl;

class TicketCarrousel extends StatefulWidget {
  @override
  _TicketCarrouselState createState() => _TicketCarrouselState();
}

class _TicketCarrouselState extends State<TicketCarrousel> {
  final controller = PageController(viewportFraction: 0.85, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              child: SizedBox(
                height: 300,
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  children: List.generate(
                      6,
                      (_) => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              right: 10,
                              left: 10,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Activo',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,
                                          // color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Ticket #2343',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${intl.DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(),
                                  Spacer(),
                                  Divider(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Total:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Text(
                                        '\$000.00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            ),
            SizedBox(height: 0),

            Container(
              child: SmoothPageIndicator(
                onDotClicked: (a) => controller.animateToPage(a,
                    duration: Duration(milliseconds: 500), curve: Curves.ease),
                controller: controller,
                count: 6,
                effect: WormEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  dotColor: Colors.black.withOpacity(0.2),
                  activeDotColor: Colors.black,
                ),
              ),
            ),

            // SmoothPageIndicator(
            //   controller: controller,
            //   count: 6,
            //   effect: JumpingDotEffect(),
            // ),

            // Container(
            //   child: SmoothPageIndicator(
            //     controller: controller,
            //     count: 6,
            //     effect: ScaleEffect(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
