import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/screens/request_form_screen/widgets/request_form_body.dart';
import 'package:e_service_app/screens/request_form_screen/widgets/request_form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestForm extends StatefulWidget {
  final data;
  RequestForm({this.data});

  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final labels = ['Problem Description', 'Fees'];

  final validators = [false, false, false];

  final List<TextEditingController> _controller =
      List.generate(2, (i) => TextEditingController());

  LoginViewmodel get _userSession => dependency();

  var selectedRegion;
  var data;
  final methodsList = ["cash", "credit card"];
  var selectedMethod;
  onselected(value) => {
        setState(() => {selectedRegion = value})
      };
  onChangedMethod(value) => {
        setState(() => {selectedMethod = value})
      };

  @override
  void initState() {
    super.initState();
    selectedRegion = _userSession.user.address[0].name;
    data = _userSession.user.address.map((e) => e.name).toList();
    selectedMethod = methodsList[0];
  }

  onClick() => {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              RequestFormBody(
                  onChangedMethod: onChangedMethod,
                  methodsList: methodsList,
                  selectedMethod: selectedMethod,
                  onselected: onselected,
                  data: data,
                  selected: selectedRegion,
                  labels: labels,
                  controller: _controller,
                  validators: validators),
              Positioned(
                bottom: 50,
                right: 0,
                child: RequestFormButtons(),
              ),
              CustomReturnBar(),
            ],
          ),
        ),
      ),
    );
  }
}
