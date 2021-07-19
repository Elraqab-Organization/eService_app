import 'package:e_service_app/screens/register/widgets/registeration_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var checkBoxController = false;

  final labels = [
    'First Name',
    'Last Name',
    'Email',
    'Password',
    'Repeat Password'
  ];
  final validators = [
    {'value': false, 'message': ''},
    {'value': false, 'message': ''},
    {'value': false, 'message': ''},
    {'value': false, 'message': ''},
    {'value': false, 'message': ''},
  ];
  List<TextEditingController> _controller =
      List.generate(5, (i) => TextEditingController());
  String selected;

  onchanged(value) => setState(() => checkBoxController = value);
  onclick() => setState(() => {});
  onselected(value) => setState(() => {selected = value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF97068),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
          child: RegistrationBody(
              labels: labels,
              onchanged: onchanged,
              onclick: onclick,
              controller: _controller,
              validators: validators,
              onselected: onselected,
              selected: selected,
              checkBoxController: checkBoxController),
        ),
      ),
    );
  }
}
