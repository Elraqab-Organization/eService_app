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

  onchanged(value) => setState(() => checkBoxController = value);
  onclick() => setState(() => {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF97068),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          child: RegistrationBody(
              labels: labels,
              onchanged: onchanged,
              onclick: onclick,
              controller: _controller,
              validators: validators,
              checkBoxController: checkBoxController),
        ),
      ),
    );
  }
}
