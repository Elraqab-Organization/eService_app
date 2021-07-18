import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/search_view_screen/search_profiles_cards.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceProviders extends StatelessWidget {
  final data;
  const ServiceProviders({this.data});

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                // FilterSearch(viewmodel: viewmodel),
                SizedBox(
                  height: 20.0,
                ),
                data.length == 0
                    ? Center(
                        child: TextComponent(
                          textColor: Colors.black,
                          title: "Empty Category!",
                          weight: FontWeight.w700,
                        ),
                      )
                    : Expanded(
                        child: Container(
                          clipBehavior: Clip.none,
                          child: ListView.builder(
                            itemCount: data.length,
                            padding: EdgeInsets.only(
                                top: 24.0, left: 8.0, right: 8.0),
                            clipBehavior: Clip.hardEdge,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => Navigator.pushNamed(
                                context,
                                "/service_provider_profile",
                                arguments: data[index],
                              ),
                              child: SearchCardResult(
                                data[index],
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          CustomReturnBar(),
        ],
      ),
    );
  }
}
