import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/profile_provider/profile_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
  final TextEditingController passwordController = TextEditingController();
  LoginViewmodel get _userSession => dependency();
  bool isEditing = false;
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, watch, child) {
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
                child: watch(profileProvider).loading
                    ? Center(child: CircularProgressIndicator())
                    : ListView(
                        children: [
                          SizedBox(height: height * 0.08),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Reset Password',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: FloatingActionButton(
                                  heroTag: "edit",
                                  backgroundColor:
                                      Color.fromRGBO(249, 112, 104, 1),
                                  foregroundColor: Colors.black,
                                  onPressed: () {
                                    setState(() {
                                      widget.isEditing = true;
                                    });
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
                              "Current Password:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: TextFormField(
                                initialValue: widget._userSession.user.password,
                                obscureText: true,
                                enabled:
                                    widget.isEditing == false ? false : true,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.visiblePassword,
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
                              "New Password:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: TextFormField(
                                textAlign: TextAlign.left,
                                obscureText: true,
                                enabled:
                                    widget.isEditing == false ? false : true,
                                keyboardType: TextInputType.visiblePassword,
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
                              "Confirm New Password:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: TextFormField(
                                textAlign: TextAlign.left,
                                enabled:
                                    widget.isEditing == false ? false : true,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
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
                          widget.isEditing == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FloatingActionButton(
                                        heroTag: "btn1",
                                        backgroundColor:
                                            Color.fromRGBO(249, 112, 104, 1),
                                        foregroundColor: Colors.black,
                                        onPressed: () {
                                          setState(() {
                                            widget.isEditing = false;
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
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      backgroundColor:
                                          Color.fromRGBO(249, 112, 104, 1),
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
                              : SizedBox(),
                        ],
                      ),
              ),
              CustomReturnBar()
            ],
          ),
        ),
      );
    });
  }
}
