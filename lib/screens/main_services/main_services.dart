import 'package:e_service_app/components/category_grid.dart';
import 'package:e_service_app/components/custom_app_bar.dart';
import 'package:e_service_app/screens/main_services/main_services_viewmodel.dart';
import 'package:e_service_app/screens/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            View(
              viewmodel: MainServicesViewmodel(),
              builder: (context, viewmodel, _) => Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  CategoryGrid(),
                ],
              ),
            ),
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
