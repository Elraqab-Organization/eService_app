import 'package:e_service_app/app/const.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/screens/login/login_viewmodel.dart';
import 'package:e_service_app/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(249, 112, 104, 1),
            body: SingleChildScrollView(
                child: View(
              viewmodel: LoginViewmodel(),
              builder: (context, viewmodel, _) => Container(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CustomerTextField(
                              nameController, 'Username Or Email'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child:
                              CustomerTextField(passwordController, 'Password'),
                        ),
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
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
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
                                    value: viewmodel.isChecked,
                                    onChanged: (bool value) =>
                                        viewmodel.setCheckedBox(value))),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _customeExtendedButton(
                            Color(0xff212738),
                            "Login",
                            Colors.white,
                            "https://pngimg.com/uploads/google/google_PNG19635.png",
                            false),
                        SizedBox(
                          height: 14,
                        ),
                        _customeExtendedButton(
                            Colors.white,
                            "Login with Google",
                            Colors.black,
                            "https://pngimg.com/uploads/google/google_PNG19635.png",
                            true),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: _buildSignUp(context),
                    )
                  ],
                ),
              ),
            ))));
  }

  Widget _customeExtendedButton(Color buttonColor, String buttonText,
      Color buttonTextColor, imageUrl, hasImage) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              hasImage
                  ? SizedBox(
                      width: 35,
                      height: 40,
                      child: Image.network(imageUrl),
                    )
                  : SizedBox(),
              SizedBox(
                width: 7,
              ),
              Text(
                buttonText,
                style: GoogleFonts.openSans(
                    color: buttonTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ],
              color: buttonColor,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(width: 0)),
        ));
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
                Text("Sign up",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
