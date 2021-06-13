import 'package:delayed_display/delayed_display.dart';
import 'package:e_service_app/model/filter_tags.dart';
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
                child: DelayedDisplay(
                  delay: Duration(seconds: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pin_drop_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        iconSize: 24,
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Location', 'Johor', 'Kuala']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ))),
        Positioned(
            child: Container(
          width: double.infinity,
          height: 250.0,
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(30.0, 15.0, 20.0, 15.0),
                      hintText: "Search your services",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100]),
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              SizedBox(
                width: 50.0,
                height: 28.0,
              ),
              Container(
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
                                if (_height == 105) {
                                  _height = 0;
                                } else {
                                  _width = 405;
                                  _height = 105;
                                }
                              });
                              // _showModalBottomSheet(context);
                            }),
                      ),
                      _searchTagButton(filterTags[4].name),
                    ],
                  ))
            ],
          ),
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
                  bottomRight: Radius.circular(30.0))),
        )),
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
