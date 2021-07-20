import 'package:delayed_display/delayed_display.dart';
import 'package:e_service_app/providers/service_providers/search_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedCategory extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: watch(searchProvider).open ? 270 : 0,
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
            watch(searchProvider).open
                ? DelayedDisplay(
                    fadingDuration: Duration(seconds: 1),
                    slidingCurve: Curves.easeInQuad,
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, bottom: 30),
                      height: 50,
                      child: ListView.builder(
                        itemCount: watch(searchProvider).tags.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: FloatingActionButton.extended(
                              backgroundColor:
                                  watch(searchProvider).current == index
                                      ? Color.fromRGBO(87, 196, 229, 1)
                                      : Color.fromRGBO(249, 112, 104, 1),
                              label: Text(watch(searchProvider).tags[index]),
                              onPressed: () => {
                                    if (watch(searchProvider).current != index)
                                      {
                                        watch(searchProvider).show = true,
                                        watch(searchProvider).current = index
                                      }
                                    else
                                      {
                                        watch(searchProvider).show = false,
                                        watch(searchProvider).current = null
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
      ),
    );
  }
}
