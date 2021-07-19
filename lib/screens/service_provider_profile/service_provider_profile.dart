import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/profile_reviews.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/screens/service_provider_profile/widgets/profile_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceProviderProfile extends StatelessWidget {
  final data;
  const ServiceProviderProfile({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ProfileInformation(data: data),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponent(
                      title: "Reviews",
                      fontSize: 16,
                      line: 1,
                      textColor: Colors.black,
                      weight: FontWeight.w600,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, "/service_provider_reviews"),
                      child: TextComponent(
                        title: "See all",
                        fontSize: 16,
                        line: 1,
                        textColor: Colors.black,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ProfileReviews(),
              ),
            ],
          ),
          CustomReturnBar(),
        ],
      ),
    );
  }
}
