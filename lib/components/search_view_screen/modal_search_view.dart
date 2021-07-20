import 'package:e_service_app/components/search_view_screen/search_profiles_cards.dart';
import 'package:e_service_app/providers/service_providers/search_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowModalBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final data = watch(searchResult);
      return data.map(
        data: (data) => Container(
          padding: EdgeInsets.all(24.0),
          height: 350.0,
          child: data.value.length == 0
              ? _noResultFound()
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: data.value.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      "/service_provider_profile",
                      arguments: data.value[index],
                    ),
                    child: SearchCardResult(
                      data.value[index],
                    ),
                  ),
                ),
          decoration: BoxDecoration(
            color: Color(0xff212738),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                color: Colors.grey[300],
                offset: Offset(0, 5),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
        error: (_) => Center(child: Text("Error")),
        loading: (_) => Center(child: CircularProgressIndicator()),
      );
    });
  }

  Widget _noResultFound() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.notification_important_outlined,
          size: 14.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "No Results Found",
          style: TextStyle(fontSize: 18, color: Colors.white),
        )
      ],
    ));
  }
}
