import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomSheetContainer extends StatefulWidget {
  final double height = 500;
  LoginViewmodel get _userSession => dependency();
  bool isEditing = false;
  @override
  _BottomSheetContainerState createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(33, 39, 56, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 39, 56, 1),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Profile Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Enter image link",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        FontAwesomeIcons.file,
                        size: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    enabled: widget.isEditing == false ? false : true,
                    initialValue: widget._userSession.user.imgSrc,
                    onChanged: (value) {
                      // watch(profileProvider).lastName = value;
                    },
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 20.0, bottom: 15.0),
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    "dummy text of the printing and typesetting industry.\n Lorem Ipsum has been\n the industry's standard dummy text ever.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Color.fromRGBO(249, 112, 104, 1),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      // widget.isEditing = false;
                    });
                  },
                  child: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                ),
              ),
              FloatingActionButton.extended(
                heroTag: "btn2",
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                backgroundColor: Color.fromRGBO(249, 112, 104, 1),
                foregroundColor: Colors.black,
                onPressed: () {
                  // Respond to button press
                },
                label: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ]),
      ),
    ]);
  }
}
// Color.fromRGBO(249, 112, 102, 1),