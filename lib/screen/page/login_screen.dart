import 'package:e_service_app/dependency/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/rounded_rectangle_button.dart';
import '../../components/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.deepOrangeAccent,
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25),
                Text(
                  'Login into your account',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomerTextField(nameController, 'Username Or Email'),
                SizedBox(height: 20),
                CustomerTextField(passwordController, 'Password'),
                SizedBox(height: 30),
                RoundedRectangleButton(
                  EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  BorderRadius.circular(70.0),
                  Colors.black,
                  Colors.black,
                  Text(
                    'Log in',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  null,
                ),
                SizedBox(height: 20),
                RoundedRectangleButton(
                    EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    BorderRadius.circular(70.0),
                    Colors.white,
                    Colors.black,
                    Text(
                      'Log in with Google',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    null),
                SizedBox(height: 75),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildSignUp(context),
                )
              ],
            ),
          ),
        ));
  }

  _buildSignUp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onDoubleTap: () => {Navigator.pushNamed(context, rRegisterScreen)},
          child: Text("Don't have an account?",
              textAlign: TextAlign.start,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
              )),
        ),
      ],
    );
  }
}
