import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HoursPop extends StatelessWidget {
  const HoursPop({
    Key key,
    @required this.boxColors,
    @required this.onTap,
  }) : super(key: key);

  final Function onTap;
  final List<Color> boxColors;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6 / 4,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 10,
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
              padding: EdgeInsets.all(16),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      AspectRatio(
                        aspectRatio: 16 / 40,
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
                              EvaIcons.clockOutline,
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
                        aspectRatio: 36 / 1,
                        child: SizedBox(),
                      ),
                      AspectRatio(
                        aspectRatio: 14 / 2,
                        child: FittedBox(
                          // fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Horas',
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
                          alignment: Alignment.centerLeft,
                          // fit: BoxFit.scaleDown,
                          child: Text(
                            '2PM',
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
                            'más ventas',
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
                  color: boxColors[1], borderRadius: BorderRadius.circular(24)),
            ),
          ),
        ),
      ),
    );
  }
}
