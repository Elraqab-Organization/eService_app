import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final Function route;
  final double height;
  final double width;
  final Icon icon;
  final String title;
  final Color color;
  final int index;

  SquareButton(
      {Function route,
      double height,
      double width,
      Icon icon,
      String title,
      Color color,
      int index})
      : route = route,
        height = height,
        width = width,
        icon = icon,
        color = color,
        index = index,
        title = title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          // onTap: () {
          // Navigator.pushReplacementNamed(context, route);
          // },
          onTap: () => route(index),
          child: Container(
            width: width,
            height: height,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: color,
              elevation: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon,
                ],
              ),
            ),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
