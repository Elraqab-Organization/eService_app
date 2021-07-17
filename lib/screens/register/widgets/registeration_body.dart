import 'package:e_service_app/screens/register/widgets/registeration_button.dart';
import 'package:e_service_app/screens/register/widgets/registeration_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationBody extends StatelessWidget {
  RegistrationBody({
    this.labels,
    this.controller,
    this.validators,
    this.checkBoxController,
    this.onchanged,
    this.onselected,
    this.selected,
    this.onclick,
  });

  final List<String> labels;
  final List<TextEditingController> controller;
  final List<Map<String, Object>> validators;
  final bool checkBoxController;
  final Function onchanged;
  final Function onclick;
  final Function onselected;
  final String selected;
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
        RegisterationForm(
          labels: labels,
          controller: controller,
          validators: validators,
          checkBoxController: checkBoxController,
          onchanged: onchanged,
          onclick: onclick,
          selected: selected,
          onselected: onselected,
        ),
        RegisterationButton(
          onclick: onclick,
          validators: validators,
          controller: controller,
          checkBoxController: checkBoxController,
          selected: selected,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildLogin(context),
        ),
      ],
    );
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
