import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../pages/categories_page.dart';
import '../pages/categories_page_descarted.dart';
import '../pages/overview_page.dart';
import '../pages/reports_screen.dart';
import '../widgets/tickets_carrousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screensWidget = <Widget>[
    OverviewPage(),
    CategoriesPage(),
    ReportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // double deviceHeigth = Scaffold.of(context).appBarMaxHeight;
    var _selection;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: _screensWidget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,

        elevation: 10,
        unselectedIconTheme: IconThemeData(
          color: Colors.black45,
          size: 20,
        ),
        unselectedItemColor: Colors.black45,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.home),
            activeIcon: Icon(EvaIcons.home),
            title: Text('Inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.gridOutline),
            activeIcon: Icon(EvaIcons.grid),
            title: Text('Categorías'),
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.monitorOutline),
            activeIcon: Icon(EvaIcons.monitor),
            title: Text('Monitor'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
