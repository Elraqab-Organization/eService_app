import 'package:e_service_app/app/const.dart';
import 'package:e_service_app/components/login_custom_button.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/screens/register/register_viewmodel.dart';
import 'package:e_service_app/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffF97068),
            body: SingleChildScrollView(
                child: View(
                    viewmodel: RegisterViewmodel(),
                    builder: (context, viewmodel, _) => Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Create\nyour account',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: CustomerTextField(
                                          nameController, 'Name'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: CustomerTextField(
                                          emailController, 'Username Or Email'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: CustomerTextField(
                                          passwordController, 'Password'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: CustomerTextField(
                                          passwordController,
                                          'Repeat Password'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Transform.scale(
                                            scale: 1.35,
                                            child: Checkbox(
                                                splashRadius: 0,
                                                fillColor: MaterialStateProperty
                                                    .resolveWith((states) {
                                                  if (states.contains(
                                                      MaterialState.selected)) {
                                                    return Colors.white;
                                                  }
                                                  return Colors.white;
                                                }),
                                                activeColor: Colors.black,
                                                hoverColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                checkColor: Colors.black,
                                                value: viewmodel.isChecked,
                                                onChanged: (bool value) =>
                                                    viewmodel
                                                        .setCheckedBox(value))),
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
                                    CustomButtomLogin(
                                        Color(0xff212738),
                                        "Sign up",
                                        Colors.white,
                                        "https://pngimg.com/uploads/google/google_PNG19635.png",
                                        false),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomButtomLogin(
                                        Colors.white,
                                        "Sign up with Google",
                                        Colors.black,
                                        "https://pngimg.com/uploads/google/google_PNG19635.png",
                                        true),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: _buildLogin(context),
                                ),
                              ],
                            ),
                          ),
                        )))));
  }

  _buildLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onDoubleTap: () => {Navigator.pushNamed(context, rLoginScreen)},
            child: Row(
              children: [
                Text("Don't have an account? ",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                Text("Sign In",
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
