import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/profile_reviews.dart';
import 'package:e_service_app/screens/service_provider_reviews/service_provider_reviews_viewmodel.dart';
import 'package:e_service_app/screens/service_provider_reviews/widgets/rating_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../view.dart';

class ServiceProviderReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          View(
            viewmodel: ServiceProviderReviewsViewmodel(),
            builder: (context, viewmodel, _) => Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Expanded(
                  flex: 2,
                  child: RatingOverview(),
                ),
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
