import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  String _route;
  double _height;
  double _width;
  Icon _icon;
  String _title;
  Color _color;

  get route => _route;
  set route(value) => _route = value;
  get height => _height;
  set height(value) => _height = value;
  get width => _width;
  set width(value) => _width = value;
  get icon => _icon;
  set icon(value) => _icon = value;
  get title => _title;
  set title(value) => _title = value;
  get color => _color;
  set color(value) => _color = value;

  SquareButton(
      {String route,
      double height,
      double width,
      Icon icon,
      String title,
      Color color})
      : _route = route,
        _height = height,
        _width = width,
        _icon = icon,
        _color = color,
        _title = title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Container(
            width: width,
            height: height,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: color,
              elevation: 10,
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
        )
      ],
    );
  }
}
