import 'package:e_service_app/components/custom_app_bar/widgets/app_header.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/search_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppHeader(),
        // AnimatedDropDown(viewmodel: viewmodel),
        // AnimatedCategory(viewmodel: viewmodel),
        SearchInputField(),
      ],
    );
  }
}
