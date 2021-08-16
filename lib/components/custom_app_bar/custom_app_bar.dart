import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/animated_category.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/animated_drop_down.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/app_header.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/search_input_field.dart';
import 'package:e_service_app/providers/service_providers/search_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  SearchViewmodel get _service => dependency();
  // ignore: missing_return
  Future<bool> _onBackPressed() {
    if (_service.open) {
      _service.show = false;
      _service.open = false;
    } else {
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AppHeader(),
          AnimatedDropDown(),
          AnimatedCategory(),
          SearchInputField(),
        ],
      ),
    );
  }
}
