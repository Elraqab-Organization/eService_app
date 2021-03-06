import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  // ignore: unused_element
  LoginViewmodel get _userSession => dependency();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      height: 160,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 112, 104, 1),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              TextComponent(
                fontSize: 20,
                textColor: Colors.white,
                title: 'Find a service',
                weight: FontWeight.w600,
                align: TextAlign.start,
              ),
            ],
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
