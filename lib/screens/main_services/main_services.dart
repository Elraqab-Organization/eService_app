import 'package:e_service_app/components/custom_app_bar.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/screens/main_services/main_services_viewmodel.dart';
import 'package:e_service_app/screens/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  Container(
                    padding:
                        EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
                    height: MediaQuery.of(context).size.height - 100,
                    child: GridView.builder(
                        padding: EdgeInsets.only(top: 70.0),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 16),
                        itemCount: 20,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: null,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 39, 56, 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: null,
                                        child: Icon(
                                          FontAwesomeIcons.solidHeart,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextComponent(
                                    title: "Electrical",
                                    fontSize: 22.0,
                                    textColor: Colors.white,
                                    weight: FontWeight.w800,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            TextComponent(
                                              title: "4.5",
                                              fontSize: 14.0,
                                              textColor: Colors.black,
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
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
