import 'package:e_service_app/components/custom_text_field.dart';
import 'package:e_service_app/components/drop_down_list.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/providers/register/registeration_action.dart';
import 'package:e_service_app/providers/services/services_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterationForm extends StatelessWidget {
  final List<String> labels;
  final List<TextEditingController> controller;
  final List<Map<String, Object>> validators;
  final bool checkBoxController;
  final Function onchanged;
  final Function onclick;
  final String selected;
  final Function onselected;

  const RegisterationForm({
    this.labels,
    this.controller,
    this.validators,
    this.checkBoxController,
    this.onchanged,
    this.onclick,
    this.selected,
    this.onselected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < labels.length; i++)
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: CustomerTextField(
              controller: controller[i],
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
        checkBoxController
            ? Consumer(builder: (context, watch, child) {
                final data = watch(serviceProvider).services;
                print(data.keys);
                return DropDownList(
                    selected: selected,
                    data: data.keys.toList(),
                    onselected: onselected);
              })
            : SizedBox(),
        SizedBox(
          height: 10,
        ),
        Consumer(
            builder: (context, watch, child) => watch(registerProvider).error
                ? TextComponent(
                    title: "Email already exist!",
                    fontSize: 16,
                    weight: FontWeight.w600,
                    textColor: Colors.white,
                  )
                : SizedBox()),
      ],
    );
  }
}
