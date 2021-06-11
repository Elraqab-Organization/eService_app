import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  Widget _route;
  double _height;
  double _width;
  Icon _icon;

  get route => _route;
  set route(value) => _route = value;
  get height => _height;
  set height(value) => _height = value;
  get width => _width;
  set width(value) => _width = value;
  get icon => _icon;
  set icon(value) => _icon = value;

  SquareButton({Widget route, double height, double width, Icon icon})
      : _route = route,
        _height = height,
        _width = width,
        _icon = icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
      child: Container(
        width: width,
        height: height,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.pink,
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
    );
  }
}
