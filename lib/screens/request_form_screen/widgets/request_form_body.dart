import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_text_field.dart';
import 'package:e_service_app/components/drop_down_list.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/requests/requests_action.dart';
import 'package:e_service_app/screens/request_form_screen/widgets/request_form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestFormBody extends StatelessWidget {
  const RequestFormBody({
    Key key,
    @required this.labels,
    @required this.selected,
    @required this.onselected,
    @required this.onChangedMethod,
    @required this.methodsList,
    @required this.serviceProvider,
    @required this.selectedMethod,
    @required this.data,
    @required List<TextEditingController> controller,
    @required this.validators,
  })  : _controller = controller,
        super(key: key);

  final Function onselected;
  final serviceProvider;
  final Function onChangedMethod;
  final List<dynamic> methodsList;
  final String selectedMethod;
  final String selected;
  final List<dynamic> data;
  final List<String> labels;
  final List<TextEditingController> _controller;
  final List<bool> validators;

  LoginViewmodel get _userSession => dependency();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 39, 56, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
          ),
          for (var i = 0; i < labels.length; i++)
            Container(
              child: CustomerTextField(
                controller: _controller[i],
                lines: i == 0 ? 5 : 1,
                labelText: labels[i],
                validate: validators[i],
              ),
            ),
          SizedBox(
            height: 30,
          ),
          DropDownList(selected: selected, data: data, onselected: onselected),
          SizedBox(
            height: 30,
          ),
          DropDownList(
            selected: selectedMethod,
            data: methodsList,
            onselected: onChangedMethod,
          ),
          Expanded(
            child: SizedBox(
              child: Consumer(
                builder: (context, watch, child) {
                  final data = watch(requestProvider).loading;
                  return data ? Center(child: CircularProgressIndicator()) : SizedBox();
                },
              ),
            ),
          ),
          RequestFormButtons(data: {
            'customerId': _userSession.user.id,
            'serviceProviderId': serviceProvider.id,
            'location': selected,
            'payment': selectedMethod,
            'description': _controller[0].text,
            'fees': _controller[1].text,
          }),
        ],
      ),
    );
  }
}
