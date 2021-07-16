import 'dart:async';
import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_text_field.dart';
import 'package:e_service_app/components/login_custom_button.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/register/registeration_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationBody extends StatelessWidget {
  const RegistrationBody({
    this.labels,
    List<TextEditingController> controller,
    this.validators,
    this.checkBoxController,
    this.onchanged,
    this.onclick,
  }) : _controller = controller;

  final List<String> labels;
  final List<TextEditingController> _controller;
  final List<Map<String, Object>> validators;
  final bool checkBoxController;
  final Function onchanged;
  final Function onclick;
  LoginViewmodel get _userSession => dependency();

  @override
  Widget build(BuildContext context) {
    return Column(
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
            for (var i = 0; i < labels.length; i++)
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: CustomerTextField(
                  controller: _controller[i],
                  labelText: labels[i],
                  error: validators[i]['message'],
                  validate: validators[i]['value'],
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.35,
                  child: Checkbox(
                    value: checkBoxController,
                    onChanged: (value) => onchanged(value),
                    splashRadius: 0,
                    fillColor: MaterialStateProperty.resolveWith((states) {
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
                  ),
                ),
                TextComponent(
                  title: "Is service provider ?",
                  fontSize: 16,
                  weight: FontWeight.w600,
                  textColor: Colors.white,
                ),
              ],
            ),
            Consumer(
                builder: (context, watch, child) =>
                    watch(registerProvider).error
                        ? TextComponent(
                            title: "Email already exist!",
                            fontSize: 16,
                            weight: FontWeight.w600,
                            textColor: Colors.white,
                          )
                        : SizedBox()),
          ],
        ),
        Consumer(
          builder: (context, watch, child) => watch(registerProvider).loading
              ? CircularProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        inputsValidator();
                        onclick();
                        Timer(Duration(milliseconds: 500), () {
                          if (validators.every((e) => e['value'] == false)) {
                            watch(registerProvider).firstName =
                                _controller[0].text;
                            watch(registerProvider).lastName =
                                _controller[1].text;
                            watch(registerProvider).email = _controller[2].text;
                            watch(registerProvider).password =
                                _controller[3].text;
                            watch(registerProvider).repeatedPassword =
                                _controller[4].text;
                            watch(registerProvider).isServiceProvider =
                                checkBoxController;
                            watch(registerProvider).registerUser();
                            if (_userSession.user != null) {
                              Navigator.of(context)
                                  .pushReplacementNamed("/landing");
                            }
                          }
                        });
                      },
                      child: CustomButtomLogin(
                          Color(0xff212738),
                          "Sign up",
                          Colors.white,
                          "https://pngimg.com/uploads/google/google_PNG19635.png",
                          false),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      // onTap: () => print(_userSession.user.firstName),
                      child: CustomButtomLogin(
                          Colors.white,
                          "Sign up with Google",
                          Colors.black,
                          "https://pngimg.com/uploads/google/google_PNG19635.png",
                          true),
                    ),
                  ],
                ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildLogin(context),
        ),
      ],
    );
  }

  bool inputsValidator() {
    bool validator;
    for (var i = 0; i < _controller.length; i++) {
      if (_controller[i].text == '') {
        validators[i]['value'] = true;
        validators[i]['message'] = "can't be empty!";
        validator = false;
      } else
        validators[i]['value'] = false;
    }
    if (_controller[3].text != _controller[4].text) {
      validators[4]['value'] = true;
      validators[4]['message'] = "doesn't match the password!";
    } else {
      validators[4]['value'] = false;
    }
    return validator;
  }

  _buildLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => {Navigator.pushReplacementNamed(context, '/')},
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
