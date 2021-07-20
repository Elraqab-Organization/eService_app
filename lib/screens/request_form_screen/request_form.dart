import 'dart:async';

import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/requests/requests_action.dart';
import 'package:e_service_app/screens/request_form_screen/widgets/request_form_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestForm extends StatefulWidget {
  final data;
  RequestForm({this.data});

  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final labels = ['Problem Description', 'Fees'];
  final validators = [false, false, false];
  final methodsList = ["cash", "credit card"];
  var selectedRegion;
  var data;
  var selectedMethod;

  LoginViewmodel get _userSession => dependency();

  final List<TextEditingController> _controller =
      List.generate(2, (i) => TextEditingController());

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
                serviceProvider: widget.data,
                selected: selectedRegion,
                labels: labels,
                controller: _controller,
                validators: validators,
              ),
              CustomReturnBar(),
              Consumer(
                builder: (context, watch, child) => AnimatedPositioned(
                  left: watch(requestProvider).message
                      ? 0
                      : -MediaQuery.of(context).size.width * 0.7,
                  bottom: 50.0,
                  duration: Duration(milliseconds: 200),
                  onEnd: () {
                    Timer(
                      Duration(seconds: 1),
                      () => {
                        watch(requestProvider).message = false,
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/landing', (Route<dynamic> route) => false)
                      },
                    );
                  },
                  child: Container(
                    height: 50.0,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(33, 39, 56, 1).withOpacity(1.0),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                      child: Text(
                        watch(requestProvider).message
                            ? watch(requestProvider).res
                            : "",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
