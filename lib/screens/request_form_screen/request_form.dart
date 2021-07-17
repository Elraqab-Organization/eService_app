import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/custom_text_field.dart';
import 'package:e_service_app/screens/request_form_screen/widgets/request_form_body.dart';
import 'package:e_service_app/screens/request_form_screen/widgets/request_form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestForm extends StatelessWidget {
  RequestForm();

  final labels = ['Problem Description', 'Fees'];
  final validators = [false, false, false];

  final List<TextEditingController> _controller =
      List.generate(2, (i) => TextEditingController());

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
