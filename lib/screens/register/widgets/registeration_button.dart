import 'dart:async';
import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/login_custom_button.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/register/registeration_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterationButton extends StatelessWidget {
  final List<String> labels;
  final List<TextEditingController> controller;
  final List<Map<String, Object>> validators;
  final bool checkBoxController;
  final Function onclick;
  final String selected;

  RegisterationButton({
    this.selected,
    this.onclick,
    this.validators,
    this.labels,
    this.controller,
    this.checkBoxController,
  });
  LoginViewmodel get _userSession => dependency();

  @override
  Widget build(BuildContext context) {
    return Consumer(
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
                        watch(registerProvider).firstName = controller[0].text;
                        watch(registerProvider).lastName = controller[1].text;
                        watch(registerProvider).email = controller[2].text;
                        watch(registerProvider).password = controller[3].text;
                        watch(registerProvider).repeatedPassword =
                            controller[4].text;
                        watch(registerProvider).isServiceProvider =
                            checkBoxController;
                        watch(registerProvider).selected = selected;
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
    );
  }

  bool inputsValidator() {
    bool validator;
    for (var i = 0; i < controller.length; i++) {
      if (controller[i].text == '') {
        validators[i]['value'] = true;
        validators[i]['message'] = "can't be empty!";
        validator = false;
      } else
        validators[i]['value'] = false;
    }
    if (controller[3].text != controller[4].text) {
      validators[4]['value'] = true;
      validators[4]['message'] = "doesn't match the password!";
    } else {
      validators[4]['value'] = false;
    }
    return validator;
  }
}
