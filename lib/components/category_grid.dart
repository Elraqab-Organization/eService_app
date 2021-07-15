import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryGrid extends StatelessWidget {
  final paddingTop;
  const CategoryGrid({
<<<<<<< HEAD
    this.paddingTop = 10.0,
    Key? key,
=======
    this.paddingTop = 70.0,
    Key key,
>>>>>>> parent of 809a89f (Merge branch 'ahmad_branch')
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0),
        child: GridView.builder(
            padding: EdgeInsets.only(top: paddingTop),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.0,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16),
            itemCount: 10,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () => Navigator.pushNamed(context, "/service_providers"),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(33, 39, 56, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: null,
                            child: Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      TextComponent(
                        title: "Electrical",
                        fontSize: 22.0,
                        textColor: Colors.white,
                        weight: FontWeight.w800,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                TextComponent(
                                  title: "4.5",
                                  fontSize: 14.0,
                                  textColor: Colors.black,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
