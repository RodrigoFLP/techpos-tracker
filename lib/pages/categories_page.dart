import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../screens/category_screen.dart';
import '../widgets/employees_pop.dart';
import '../widgets/hours_pop.dart';
import '../widgets/products_pop.dart';
import '../widgets/range_picker.dart';
import '../widgets/sales_pop.dart';
import '../widgets/tickets_pop.dart';

class CategoriesPage extends StatelessWidget {
  final List<Color> boxColors = [
    const Color.fromRGBO(255, 43, 83, 1),
    const Color.fromRGBO(255, 118, 72, 1),
    const Color.fromRGBO(24, 42, 136, 1),
    const Color.fromRGBO(77, 197, 145, 1),
  ];

  

  @override
  Widget build(BuildContext context) {
    double availableHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    print('altura: $availableHeight');
    double availableWidth = MediaQuery.of(context).size.width;
    print('ancho: $availableWidth');
    print('ratio: ${(MediaQuery.of(context).size.height) / (availableWidth)}');

    Widget _landscapeScreen = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: availableWidth,
        height: availableHeight,
              child: Row(children: [
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.black,
            ),
          ),
          // ProductsPop(
          //   onTap: () => Navigator.pushNamed(context, CategoryScreen.routeName,
          //       arguments: 'Productos'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: SalesPop(
          //     boxColors: boxColors,
          //     onTap: () => Navigator.pushNamed(context, CategoryScreen.routeName,
          //         arguments: 'Ventas'),
          //   ),
          // ),
        ]),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categorías',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          RangePicker(),
        ],
        elevation: 1,
        shadowColor: Colors.white.withOpacity(0.8),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            EvaIcons.menu2,
            color: Colors.black,
          ),
          onPressed: null,
        ),
      ),
      backgroundColor: Color.fromRGBO(237, 242, 247, 1),
      body: OrientationBuilder(builder: (context, orientation) {
        Widget w = Container();
        orientation == Orientation.portrait
            ? w = SingleChildScrollView(
                child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 1,
                            child: SizedBox(),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    SalesPop(
                                      boxColors: boxColors,
                                      onTap: () => Navigator.pushNamed(
                                          context, CategoryScreen.routeName,
                                          arguments: 'Ventas'),
                                    ),
                                    HoursPop(
                                      boxColors: boxColors,
                                      onTap: () => Navigator.pushNamed(
                                          context, CategoryScreen.routeName,
                                          arguments: 'Horas'),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    EmployeesPop(
                                      boxColors: boxColors,
                                      onTap: () => Navigator.pushNamed(
                                          context, CategoryScreen.routeName,
                                          arguments: 'Empleados'),
                                    ),
                                    TicketsPop(
                                      boxColors: boxColors,
                                      onTap: () => Navigator.pushNamed(
                                          context, CategoryScreen.routeName,
                                          arguments: 'Órdenes'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ProductsPop(
                            onTap: () => Navigator.pushNamed(
                                context, CategoryScreen.routeName,
                                arguments: 'Productos'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            : w = _landscapeScreen;
        return w;
      }),
    );
  }
}
