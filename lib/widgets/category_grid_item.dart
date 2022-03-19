import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final IconData iconShadow;
  final Color bgColor;
  final String title;
  final Function tapFunction;
  final double cRadius;

  CategoryGridItem(
      {@required this.iconShadow,
      @required this.bgColor,
      @required this.title,
      @required this.tapFunction,
      @required this.cRadius});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, parentConstraints) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: bgColor.withAlpha(102),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(cRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(cRadius),
            child: Material(
              child: Ink(
                child: InkWell(
                  splashColor: Colors.black,
                  onTap: tapFunction,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Transform.rotate(
                          angle: -0.523599,
                          child: Icon(
                            iconShadow,
                            size: 150,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: parentConstraints.maxHeight*0.2,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        bgColor.withAlpha(229),
                        bgColor,
                      ]),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
