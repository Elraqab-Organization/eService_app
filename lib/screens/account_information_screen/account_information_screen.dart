import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:flutter/material.dart';

class AccountInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.06),
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 39, 56, 1),
              ),
              child: ListView(
                children: [
                  SizedBox(height: height * 0.08),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Account Information',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 30, 0, 0),
                        child: FloatingActionButton(
                          heroTag: "edit",
                          backgroundColor: Color.fromRGBO(249, 112, 104, 1),
                          foregroundColor: Colors.black,
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "First Name:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: TextField(
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Last Name:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: TextField(
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Username:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: TextField(
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Gender:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: TextField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Phone number:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: TextField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.phone,
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Email:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: TextField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.emailAddress,
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
                  SizedBox(
                    height: height * 0.08,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: FloatingActionButton(
                  //         heroTag: "btn1",
                  //         backgroundColor: Color.fromRGBO(249, 112, 104, 1),
                  //         foregroundColor: Colors.black,
                  //         onPressed: () {
                  //           // Respond to button press
                  //         },
                  //         child: Icon(
                  //           Icons.cancel,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //     FloatingActionButton.extended(
                  //       heroTag: "btn2",
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25.0),
                  //       ),
                  //       backgroundColor: Color.fromRGBO(249, 112, 104, 1),
                  //       foregroundColor: Colors.black,
                  //       onPressed: () {
                  //         // Respond to button press
                  //       },
                  //       label: Text(
                  //         "Reset",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            CustomReturnBar()
          ],
        ),
      ),
    );
  }
}
