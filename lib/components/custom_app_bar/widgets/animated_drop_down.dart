import 'package:e_service_app/components/drop_down_list.dart';
import 'package:e_service_app/providers/service_providers/search_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedDropDown extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) => AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutSine,
        height: watch(searchProvider).show ? 350 : 0,
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
                Icon(
                  Icons.file_copy_rounded,
                  color: Colors.white,
                ),
                Container(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: watch(searchProvider).current != null
                      ? DropDownList(
                          data: watch(searchProvider)
                              .list[watch(searchProvider).current],
                          onselected: (value) =>
                              watch(searchProvider).value = value,
                          selected: watch(searchProvider).value,
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
