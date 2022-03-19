import 'package:flutter/material.dart';
import '../screens/category_screen.dart';
import '../widgets/category_grid_item.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class CategoriesPageDescarted extends StatelessWidget {
  const CategoriesPageDescarted({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double availableHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight -
        kBottomNavigationBarHeight;
    double availableWidth = MediaQuery.of(context).size.width;
    return Container(
      width: availableWidth,
      height: availableHeight,
      child: Stack(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  right: availableWidth * 0.1, left: availableWidth * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: availableHeight * 0.05,
                  ),
                  Container(
                    height: availableHeight * 0.03,
                    child: FittedBox(
                      child: Text(
                        'Bienvenido ¨usuario¨',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: availableHeight * 0.03,
                    child: FittedBox(
                      child: Text(
                        DateTime.now().toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: availableHeight * 0.06,
                    child: FittedBox(
                      child: Text(
                        'NOMBRE NEGOCIO',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            width: double.infinity,
            height: availableHeight * 0.3,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context)
                        .primaryColor
                        .withBlue(Theme.of(context).primaryColor.blue - 40)
                        .withGreen(Theme.of(context).primaryColor.green - 40)
                        .withRed(Theme.of(context).primaryColor.red - 40),
                  ]),
            ),
          ),
          Column(children: [
            SizedBox(height: availableHeight * 0.20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
              ),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: availableWidth * 0.05),
                height: availableHeight * 0.20,
                // child: FloatingContainer(
                //   title: 'VENTAS DE HOY',
                //   total: '656.34',
                //   mapData: [
                //     {
                //       'day': 'L',
                //       'total': 10.0,
                //     },
                //     {
                //       'day': 'M',
                //       'total': 21.0,
                //     },
                //     {
                //       'day': 'M',
                //       'total': 14.0,
                //     },
                //     {
                //       'day': 'J',
                //       'total': 22.0,
                //     },
                //     {
                //       'day': 'V',
                //       'total': 25.0,
                //     },
                //   ],
                // ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: availableWidth * 0.05,
                vertical: availableHeight * 0.05,
              ),
              height: availableHeight * 0.59,
              width: availableWidth,
              child: FittedBox(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: availableHeight * 0.15,
                          width: availableWidth * 0.5,
                          child: CategoryGridItem(
                            bgColor: Color.fromRGBO(89, 124, 253, 1),
                            iconShadow: EvaIcons.car,
                            title: 'Inventario',
                            tapFunction: () => Navigator.pushNamed(
                                context, CategoryScreen.routeName),
                            cRadius: 14,
                          ),
                        ),
                        SizedBox(
                          height: availableHeight * 0.04,
                        ),
                        Container(
                          height: availableHeight * 0.15,
                          width: availableWidth * 0.5,
                          child: CategoryGridItem(
                            bgColor: Color.fromRGBO(250, 81, 80, 1),
                            iconShadow: EvaIcons.people,
                            title: 'Ventas por empleado',
                            tapFunction: () => Navigator.pushNamed(
                                context, CategoryScreen.routeName),
                            cRadius: 14,
                          ),
                        ),
                        SizedBox(
                          height: availableHeight * 0.04,
                        ),
                        Container(
                          height: availableHeight * 0.15,
                          width: availableWidth * 0.5,
                          child: CategoryGridItem(
                            bgColor: Color.fromRGBO(183, 183, 255, 1),
                            iconShadow: EvaIcons.clockOutline,
                            title: 'Ventas por hora',
                            tapFunction: () => Navigator.pushNamed(
                                context, CategoryScreen.routeName),
                            cRadius: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: availableWidth * 0.05,
                    ),
                    Column(
                      children: [
                        Container(
                          height: availableHeight * 0.15,
                          width: availableWidth * 0.5,
                          child: CategoryGridItem(
                            bgColor: Color.fromRGBO(255, 139, 181, 1),
                            iconShadow: EvaIcons.shoppingBag,
                            title: 'Ventas por tickets',
                            tapFunction: () => Navigator.pushNamed(
                                context, CategoryScreen.routeName),
                            cRadius: 14,
                          ),
                        ),
                        SizedBox(
                          height: availableHeight * 0.04,
                        ),
                        Container(
                          height: availableHeight * 0.15,
                          width: availableWidth * 0.5,
                          child: CategoryGridItem(
                            bgColor: Color.fromRGBO(71, 63, 151, 1),
                            iconShadow: EvaIcons.trendingUp,
                            title: 'Ventas por productos',
                            tapFunction: () => Navigator.pushNamed(
                                context, CategoryScreen.routeName),
                            cRadius: 14,
                          ),
                        ),
                        SizedBox(
                          height: availableHeight * 0.04,
                        ),
                        Container(
                          height: availableHeight * 0.15,
                          width: availableWidth * 0.5,
                          child: CategoryGridItem(
                            bgColor: Color.fromRGBO(119, 119, 255, 1),
                            iconShadow: EvaIcons.pieChart,
                            title: 'Datos generales',
                            tapFunction: () => Navigator.pushNamed(
                                context, CategoryScreen.routeName),
                            cRadius: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // child: GridView(
              //   padding: EdgeInsets.symmetric(
              //       vertical: availableHeight * 0.05,
              //       horizontal: availableWidth * 0.05),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: availableWidth * 0.05,
              //     mainAxisSpacing: availableHeight * 0.03,
              //     childAspectRatio: 3 / 2,
              //   ),
              //   children: [
              //   ],
              // ),
            ),
          ]),
        ],
      ),
    );
  }
}
