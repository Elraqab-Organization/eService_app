import 'package:e_service_app/components/search_view_screen/search_area_view.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SearchAreaBox()));
  }
}
