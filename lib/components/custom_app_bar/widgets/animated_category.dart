import 'package:delayed_display/delayed_display.dart';
import 'package:e_service_app/components/search_view_screen/modal_search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../search_viewmodel.dart';

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
