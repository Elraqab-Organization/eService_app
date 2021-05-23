import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                SizedBox(height: 110),
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
                _buildTextField(nameController, 'Username Or Email'),
                SizedBox(height: 20),
                _buildTextField(passwordController, 'Password'),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      elevation: 18.0,
                      minWidth: double.maxFinite,
                      height: 60,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      onPressed: () {},
                      color: Colors.black,
                      child: Text('Log in',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      textColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      elevation: 18.0,
                      minWidth: double.maxFinite,
                      height: 60,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      onPressed: () {},
                      color: Colors.white,
                      child: Text('Log in with Google',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      textColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 125),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildSignUp(),
                )
              ],
            ),
          ),
        ));
  }

  _buildSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("Don't have an account?",
            textAlign: TextAlign.start,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 20,
            )),
      ],
    );
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          border: Border(bottom: BorderSide(width: 2.0, color: Colors.white))),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
  }
}
