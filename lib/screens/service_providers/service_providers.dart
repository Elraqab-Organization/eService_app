import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/search_view_screen/search_profiles_cards.dart';
import 'package:e_service_app/model/search_profile.dart';
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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(24.0),
            color: Color.fromRGBO(237, 242, 239, 1),
            child: Column(
              children: [
                SizedBox(
                  height: 140,
                ),
                // FilterSearch(viewmodel: viewmodel),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.none,
                    child: ListView.builder(
                      itemCount: usernames.length,
                      padding:
                          EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0),
                      clipBehavior: Clip.hardEdge,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, "/service_provider_profile"),
                        child: SearchCardResult(usernames[index].username,
                            usernames[index].photoString),
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
