import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/search_view_screen/search_profiles_cards.dart';
import 'package:e_service_app/screens/service_providers/service_providers_viewmodel.dart';
import 'package:e_service_app/screens/service_providers/widgets/filter_search.dart';
import 'package:e_service_app/screens/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceProviders extends StatefulWidget {
  @override
  _ServiceProvidersState createState() => _ServiceProvidersState();
}

class _ServiceProvidersState extends State<ServiceProviders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          View(
            viewmodel: ServiceProvidersViewmodel(),
            builder: (context, viewmodel, _) => Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(24.0),
              color: Color.fromRGBO(237, 242, 239, 1),
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  FilterSearch(viewmodel: viewmodel),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) => SearchCardResult(
                            "Ahmad", Color.fromRGBO(33, 39, 56, 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomReturnBar(),
        ],
      ),
    );
  }
}
