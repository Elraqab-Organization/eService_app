import 'package:e_service_app/model/filter_tags.dart';
import 'package:flutter/material.dart';
import 'modal_search_view.dart';

class SearchAreaBox extends StatefulWidget {
  @override
  _SearchAreaBoxState createState() => _SearchAreaBoxState();
}

class _SearchAreaBoxState extends State<SearchAreaBox> {
  bool isShown = false;
  bool isPressed = false;

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
        isShown
            ? Positioned(
                top: 220,
                child: Card(
                    color: Color(0xffF97068),
                    elevation: 20,
                    borderOnForeground: false,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(30))),
                    child: Container(
                        width: 402,
                        height: 105,
                        child: Row(
                          children: [],
                        ))))
            : Positioned(child: Container()),
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
                  child: ListView.builder(
                    itemCount: filterTags.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: FloatingActionButton.extended(
                          backgroundColor: Color(0xff0ffF97068),
                          onPressed: () {
                            if (filterTags[index].name == "Location") {
                              setState(() {
                                isShown = !isShown;
                              });
                            } else {
                              _showModalBottomSheet(context);
                            }
                          },
                          label: Text(filterTags[index].name)),
                    ),
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
}
