import 'package:e_service_app/components/category_grid.dart';
import 'package:e_service_app/components/custom_app_bar/custom_app_bar.dart';
import 'package:e_service_app/providers/services/services_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 200.0,
                  ),
                  Consumer(builder: (context, watch, child) {
                    final data = watch(serviceProvider).services;
                    // final data = context.read(getServices);
                    return CategoryGrid(data: data);
                  }),
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
