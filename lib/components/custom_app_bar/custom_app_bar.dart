import 'package:delayed_display/delayed_display.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/app_header.dart';
import 'package:e_service_app/components/custom_app_bar/widgets/search_input_field.dart';
import 'package:e_service_app/components/search_view_screen/modal_search_view.dart';
import 'package:e_service_app/model/filter_tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class CustomAppBar extends StatefulWidget {
  double height = 160;
  bool isOpen = false;
  bool isShown = false;
  int tagCurrentInde;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  // onClick() => setState(() => {widget.isOpen = true});
  onClick() => KeyboardVisibilityNotification().addNewListener(
        onChange: (bool visible) {
          // print(visible);
          // print(visible),
          Future.delayed(
              Duration(milliseconds: 50),
              () => {
                    setState(() => {
                          visible ? widget.isOpen = visible : null,
                        })
                  });
        },
      );
  onLongTap() => setState(() => {widget.isOpen = false});
  bool isPressed = false;
  String dropdownValue = 'Location';

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return ShowModalBottom();
        });
  }

  Widget _searchTagButton(Tag tag, index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: FloatingActionButton.extended(
        backgroundColor: widget.tagCurrentInde == index
            ? Color.fromRGBO(87, 196, 229, 1)
            : Color.fromRGBO(249, 112, 104, 1),
        label: Text(tag.name),
        onPressed: () => setState(
          () => {
            if (widget.tagCurrentInde != index)
              {widget.isShown = true, widget.tagCurrentInde = index}
            else
              {widget.isShown = false, widget.tagCurrentInde = null}
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppHeader(widget: widget),
        AnimatedContainer(
          clipBehavior: Clip.none,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeOutSine,
          height: widget.isShown ? 350 : 0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 112, 104, 1),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: widget.isOpen ? 270 : 0,
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
              widget.isOpen
                  ? DelayedDisplay(
                      fadingDuration: Duration(seconds: 1),
                      delay: Duration(seconds: 1),
                      slidingCurve: Curves.easeInQuad,
                      child: Container(
                          margin: const EdgeInsets.only(left: 30, bottom: 30),
                          height: 50,
                          child: ListView.builder(
                            itemCount: filterTags.length,
                            itemBuilder: (context, index) =>
                                _searchTagButton(filterTags[index], index),
                            scrollDirection: Axis.horizontal,
                          )),
                    )
                  : SizedBox(
                      height: 0,
                    ),
            ],
          ),
        ),
        SearchInputField(
          isOpen: widget.isOpen,
          callback1: onClick,
          callback2: onLongTap,
        ),
      ],
    );
  }
}
