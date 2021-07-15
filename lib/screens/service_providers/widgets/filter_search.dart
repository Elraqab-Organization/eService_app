import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dropdown_list.dart';

class FilterSearch extends StatelessWidget {
  final dynamic viewmodel;
  const FilterSearch({
    Key key,
    this.viewmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewmodel.category.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => {
            print(viewmodel.category[index]),
            if (viewmodel.index == index)
              viewmodel.active = null
            else
              {
                viewmodel.active = index,
                buildShowModalBottomSheet(context, viewmodel),
              },
          },
          child: Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: viewmodel.index == index
                  ? Color.fromRGBO(33, 39, 56, 1)
                  : Color.fromRGBO(249, 112, 104, 1),
            ),
            child: Center(
              child: TextComponent(
                title: viewmodel.category[index]['name'],
                align: TextAlign.center,
                fontSize: 14,
                textColor: Colors.white,
                weight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context, viewmodel) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.all(32.0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(33, 39, 56, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            )),
        height: MediaQuery.of(context).size.height * 0.25,
        child: Row(
          children: [
            viewmodel.category[viewmodel.index]['icon'],
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: DropDownDemo(viewmodel),
            )
          ],
        ),
      ),
    ).then((value) => null);
  }
}
