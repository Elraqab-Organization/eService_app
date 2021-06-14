import 'package:delayed_display/delayed_display.dart';
import 'package:e_service_app/model/filter_tags.dart';
import 'package:e_service_app/screens/service_providers/widgets/dropdown_list.dart';
import 'package:flutter/material.dart';
import 'modal_search_view.dart';

class SearchAreaBox extends StatefulWidget {
  @override
  _SearchAreaBoxState createState() => _SearchAreaBoxState();
}

class _SearchAreaBoxState extends State<SearchAreaBox> {
  //
  bool isShown = false;
  bool isPressed = false;

  //
  double _width = 405;
  double _height = 0;

  //
  String dropdownValue = 'Location';

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return ShowModalBottom();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: 200,
          child: AnimatedContainer(
            margin: const EdgeInsets.only(left: 3),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: _width,
            height: _height,
            color: Color(0xff0ffF97068),
            // child: DelayedDisplay(
            // delay: Duration(seconds: 3),
            // child: DropDownDemo(viewmodal),
            // ),
          ),
        ),
        Positioned(
          child: Container(
            width: double.infinity,
            height: 250.0,
            child: Container(
                margin: const EdgeInsets.only(left: 20),
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _searchTagButton(filterTags[0].name),
                    _searchTagButton(filterTags[1].name),
                    _searchTagButton(filterTags[2].name),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: FloatingActionButton.extended(
                          backgroundColor: Color(0xff0ffF97068),
                          label: Text("location"),
                          onPressed: () {
                            setState(() {
                              if (_height == 300) {
                                _height = 0;
                              } else {
                                _width = 405;
                                _height = 300;
                              }
                            });
                            // _showModalBottomSheet(context);
                          }),
                    ),
                    _searchTagButton(filterTags[4].name),
                  ],
                )),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Color(0xff212738),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchTagButton(String tag) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: FloatingActionButton.extended(
          backgroundColor: Color(0xff0ffF97068),
          label: Text(tag),
          onPressed: () => _showModalBottomSheet(context)),
    );
  }
}
