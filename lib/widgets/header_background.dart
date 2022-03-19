import 'package:flutter/material.dart';

class HeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, parentConstraints) {
        return Container(
          // color: Colors.black.withOpacity(0.2),

          width: parentConstraints.maxWidth,

          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 40,
            right: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Colors.black.withOpacity(0.2),
                width: (parentConstraints.maxWidth - 70) * 0.6,
                // color: Colors.blue,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¡Bienvenido Juan!',
                        style: (TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                      ),
                      Text(
                        'Restaurante Panchos Villa',
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: (TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CircleAvatar(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: (parentConstraints.maxWidth - 80) * 0.08,
                ),
                backgroundColor: Colors.black.withOpacity(0.2),
                radius: (parentConstraints.maxWidth - 80) * 0.08 + 2,
              ),
            ],
          ),

          // child: Padding(
          //   padding: EdgeInsets.only(
          //     left: 50,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       AspectRatio(
          //         aspectRatio: 16 / 1,
          //         child: SizedBox(),
          //       ),
          //       Container(
          //         child: Text(
          //           'Bienvenido Juan',
          //           style: TextStyle(
          //             fontSize: 14,
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //       Container(
          //         child: Text(
          //           DateFormat.yMMMMEEEEd().format(DateTime.now()),
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontWeight: FontWeight.normal,
          //           ),
          //         ),
          //       ),
          //       Container(
          //         child: Text(
          //           'Nombre Negocio',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 18,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
          //   // color: Theme.of(context).primaryColor,
          //   gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         // Theme.of(context).primaryColor,
          //         Colors.white,
          //         Color.fromRGBO(18, 32, 61, 1),
          //       ]),
          // ),
        );
      },
    );
  }
}
