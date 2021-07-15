import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
<<<<<<< HEAD
  final Function? route;
  final double? height;
  final double? width;
  final Icon? icon;
  final String? title;
  final Color? color;
  final int? index;

  SquareButton(
      {this.route,
      this.height,
      this.width,
      this.icon,
      this.title,
      this.color,
      this.index});
=======
  Function _route;
  double _height;
  double _width;
  Icon _icon;
  String _title;
  Color _color;
  int _index;

  get route => _route;
  set route(value) => _route = value;
  get index => _index;
  set index(value) => _index = value;
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
      {Function route,
      double height,
      double width,
      Icon icon,
      String title,
      Color color,
      int index})
      : _route = route,
        _height = height,
        _width = width,
        _icon = icon,
        _color = color,
        _index = index,
        _title = title;
>>>>>>> parent of 809a89f (Merge branch 'ahmad_branch')

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          // onTap: () {
          // Navigator.pushReplacementNamed(context, route);
          // },
<<<<<<< HEAD
          onTap: () => route!(index),
=======
          onTap: () => route(_index),
>>>>>>> parent of 809a89f (Merge branch 'ahmad_branch')
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
                  icon!,
                ],
              ),
            ),
          ),
        ),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
