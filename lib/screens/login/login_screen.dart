import 'package:e_service_app/app/const.dart';
import 'package:e_service_app/components/login_custom_button.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/providers/login/login_action.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CustomerTextField(
                          onChanged: (value) =>
                              context.read(loginProvider).username = value,
                          controller: nameController,
                          labelText: 'Username Or Email'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: CustomerTextField(
                          onChanged: (value) =>
                              context.read(loginProvider).password = value,
                          controller: passwordController,
                          labelText: 'Password'),
                    ),
                    Consumer(builder: (context, watch, child) {
                      final data = watch(loginProvider).showErrorMessage;
                      return data
                          ? Text(
                              'Username or password is incorrect',
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
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
                            onChanged: (bool value) => context
                                .read(loginProvider)
                                .setCheckedBox(value),
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
                              watch(loginProvider).loading = true;
                              final user =
                                  await watch(loginProvider).authenticate();
                              // if (user != null)
                                Navigator.pushReplacementNamed(
                                    context, "/landing");
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
