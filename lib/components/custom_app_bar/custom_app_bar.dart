import 'package:delayed_display/delayed_display.dart';
import 'package:e_service_app/components/custom_app_bar/search_viewmodel.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/app_header.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/search_input_field.dart';
import 'package:e_service_app/components/search_view_screen/modal_search_view.dart';
import 'package:e_service_app/screens/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: SearchViewmodel(),
      builder: (context, viewmodel, _) => Stack(
        clipBehavior: Clip.none,
        children: [
          AppHeader(),
          AnimatedDropDown(viewmodel: viewmodel),
          AnimatedCategory(viewmodel: viewmodel),
          SearchInputField(viewmodel: viewmodel),
        ],
      ),
    );
  }
}

class AnimatedCategory extends StatelessWidget {
  final SearchViewmodel viewmodel;
  const AnimatedCategory({this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: viewmodel.state ? 270 : 0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 39, 56, 1),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          viewmodel.isOpen
              ? DelayedDisplay(
                  fadingDuration: Duration(seconds: 1),
                  slidingCurve: Curves.easeInQuad,
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 30),
                    height: 50,
                    child: ListView.builder(
                      itemCount: viewmodel.filterTags.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: FloatingActionButton.extended(
                            backgroundColor: viewmodel.tag == index
                                ? Color.fromRGBO(87, 196, 229, 1)
                                : Color.fromRGBO(249, 112, 104, 1),
                            label: Text(viewmodel.filterTags[index].name),
                            onPressed: () => {
                                  if (viewmodel.tag != index)
                                    {
                                      viewmodel.shown = true,
                                      viewmodel.tag = index
                                    }
                                  else
                                    {
                                      viewmodel.shown = false,
                                      viewmodel.tag = null
                                    }
                                }),
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return ShowModalBottom();
        });
  }
}

class AnimatedDropDown extends StatelessWidget {
  final SearchViewmodel viewmodel;
  const AnimatedDropDown({this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      clipBehavior: Clip.hardEdge,
      duration: Duration(milliseconds: 150),
      curve: Curves.easeOutSine,
      height: viewmodel.shown ? 350 : 0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 112, 104, 1),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Icon(FontAwesomeIcons.locationArrow),
              viewmodel.tagCurrentIndex != null
                  ? viewmodel.filterTags[viewmodel.tagCurrentIndex].icon
                  : SizedBox(),
              Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: viewmodel.tagCurrentIndex != null
                    ? DropDownList(viewmodel: viewmodel)
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownList extends StatelessWidget {
  final SearchViewmodel viewmodel;
  const DropDownList({@required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          value: viewmodel.filterTags[viewmodel.tagCurrentIndex].selected,
          items: viewmodel.filterTags[viewmodel.tagCurrentIndex].values
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (value) => {
                viewmodel.filterTags[viewmodel.tagCurrentIndex].selected = value
              }),
    );
  }
}
