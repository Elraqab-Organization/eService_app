import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/profile_reviews.dart';
import 'package:e_service_app/screens/service_provider_profile/service_provider_profile_viewmodel.dart';
import 'package:e_service_app/screens/service_provider_profile/widgets/profile_information.dart';
import 'package:e_service_app/screens/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceProviderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          View(
            viewmodel: ServiceProviderProfileViewmodel(),
            builder: (context, viewmodel, _) => Column(
              children: [
                ProfileInformation(),
                Expanded(
                  flex: 2,
                  child: ProfileReviews(),
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
