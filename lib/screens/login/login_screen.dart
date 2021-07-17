import 'dart:async';

import 'package:e_service_app/app/const.dart';
import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/login_custom_button.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/providers/login/login_action.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<TextEditingController> _controller =
      List.generate(2, (i) => TextEditingController());

  final labels = ['Username Or Email', 'Password'];
  final validators = [false, false];
  LoginViewmodel get _userSession => dependency();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 112, 104, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Login into \nyour account',
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )),
              Column(
                children: [
                  for (var i = 0; i < labels.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CustomerTextField(
                          validate: validators[i],
                          controller: _controller[i],
                          labelText: labels[i]),
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Consumer(builder: (context, watch, child) {
                    final data = watch(loginProvider).showErrorMessage;
                    return data
                        ? Text(
                            'Username or password is incorrect',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        : SizedBox();
                  }),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.35,
                        child: Checkbox(
                          splashRadius: 0,
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.white;
                            }
                            return Colors.white;
                          }),
                          activeColor: Colors.black,
                          hoverColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          checkColor: Colors.black,
                          value: context.read(loginProvider).isChecked,
                          onChanged: (bool value) => setState(() =>
                              {context.read(loginProvider).isChecked = value}),
                        ),
                      ),
                      TextComponent(
                        title: "Remember me",
                        fontSize: 16,
                        weight: FontWeight.w600,
                        textColor: Colors.white,
                      )
                    ],
                  )
                ],
              ),
              Consumer(builder: (context, watch, child) {
                final data = watch(loginProvider).loading;
                return data
                    ? CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButtomLogin(
                              Color(0xff212738),
                              "Login",
                              Colors.white,
                              "https://pngimg.com/uploads/google/google_PNG19635.png",
                              false, onTap: () async {
                            for (var i = 0; i < _controller.length; i++) {
                              if (_controller[i].text == '') {
                                validators[i] = true;
                              } else
                                validators[i] = false;
                            }
                            setState(() {});
                            Timer(Duration(milliseconds: 500), () async {
                              if (validators.every((e) => e == false)) {
                                context.read(loginProvider).username =
                                    _controller[0].text;
                                context.read(loginProvider).password =
                                    _controller[1].text;
                                watch(loginProvider).loading = true;
                                await watch(loginProvider).authenticate();
                                if (_userSession.user != null)
                                  Navigator.pushReplacementNamed(
                                      context, "/landing");
                              }
                            });
                          }),
                          SizedBox(
                            height: 14,
                          ),
                          CustomButtomLogin(
                            Colors.white,
                            "Login with Google",
                            Colors.black,
                            "https://pngimg.com/uploads/google/google_PNG19635.png",
                            true,
                            // onTap: () => _onLogin(context),
                          ),
                        ],
                      );
              }),
              Align(
                alignment: Alignment.bottomLeft,
                child: _buildSignUp(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildSignUp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onDoubleTap: () => {Navigator.pushNamed(context, rRegisterScreen)},
            child: Row(
              children: [
                Text("Don't have an account? ",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed('/register'),
                  child: Text("Sign up",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
