import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../widgets/pie_chart_ov.dart';

class ProductsPop extends StatelessWidget {
  const ProductsPop({
    Key key,
    @required this.onTap,
  }) : super(key: key);
  
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: Ink(
            padding: EdgeInsets.all(16),
            child: Stack(
              children: [
                PieChart2(),
                Row(
                  children: [
                    Spacer(),
                    AspectRatio(
                      aspectRatio: 9 / 80,
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
                            EvaIcons.shoppingBag,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 76 / 1,
                      child: SizedBox(),
                    ),
                    AspectRatio(
                      aspectRatio: 32 / 2,
                      child: FittedBox(
                        // fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Productos',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 20 / 1,
                      child: SizedBox(),
                    ),
                    AspectRatio(
                      aspectRatio: 24 / 2,
                      child: FittedBox(
                        // fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '1. Taquiza',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 24 / 2,
                      child: FittedBox(
                        // fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '2. Torta de res',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 24 / 2,
                      child: FittedBox(
                        // fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '3. Tacos al pastor',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 34 / 2,
                      child: FittedBox(
                        // fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'más vendidos',
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
              ],
            ),
            decoration: BoxDecoration(
                color: Color(0xff845bef),
                borderRadius: BorderRadius.circular(24)),
          ),
        ),
      ),
    );
  }
}
