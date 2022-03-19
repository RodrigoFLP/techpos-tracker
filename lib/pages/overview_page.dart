import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:techpos_track/style/colors.dart';
import '../widgets/header_background.dart';
import '../widgets/tickets_carrousel.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double availableHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    print('altura: $availableHeight');
    double availableWidth = MediaQuery.of(context).size.width;
    print('ancho: $availableWidth');
    print('ratio: ${(MediaQuery.of(context).size.height) / (availableWidth)}');

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 20,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'TechPos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              height: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(),
            ),
            ListTile(
              leading: Icon(
                EvaIcons.briefcaseOutline,
                color: Colors.black,
              ),
              title: Text(
                'Negocios',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                EvaIcons.settingsOutline,
                color: Colors.black,
              ),
              title: Text(
                'Ajustes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(237, 242, 247, 1),
      appBar: AppBar(
        iconTheme: new IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Inicio',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
        actions: [
          PopupMenuButton<String>(
            // offset: Offset.fromDirection(3.1416 * 3 / 4, 100),
            elevation: 4,
            tooltip: 'Opciones',
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onSelected: (String result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: '1',
                child: Text('Negocio 1'),
              ),
              const PopupMenuItem<String>(
                value: '1',
                child: Text('Negocio 2'),
              ),
              const PopupMenuItem<String>(
                value: '1',
                child: Text('Ajustes'),
              ),
              const PopupMenuItem<String>(
                value: '1',
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
        elevation: 1,
        shadowColor: Colors.white.withOpacity(0.8),

        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(
        //     EvaIcons.menu2,
        //     color: Colors.white,
        //   ),
        //   onPressed: null,
        // ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(
              top: 30,
            ),
            width: availableWidth,
            child: Column(
              children: [
                HeaderBackground(),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: TicketCarrousel(),
                ),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   children: [
                //     Flexible(
                //       flex: 1,
                //       child: Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(
                //               left: 20,
                //               right: 10,
                //               bottom: 10,
                //             ),
                //             child: Container(
                //               height: 100,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(24),
                //                 color: AppColors.iterativeColors[3],
                //               ),
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(
                //               top: 10,
                //               left: 20,
                //               right: 10,
                //             ),
                //             child: Container(
                //               height: 100,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(24),
                //                 color: AppColors.iterativeColors[1],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Flexible(
                //       flex: 2,
                //       child: Padding(
                //         padding: const EdgeInsets.only(
                //           left: 10,
                //           right: 20,
                //         ),
                //         child: Container(
                //           height: 220,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(24),
                //             color: AppColors.iterativeColors[0],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 20,
                  width: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
