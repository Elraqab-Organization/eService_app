import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: ListTile(
              leading: CircleAvatar(
                radius: 29,
                child: SvgPicture.asset(
                  "lib/assets/icon/1.svg",
                  fit: BoxFit.cover,
                ),
              ),
              title: TextComponent(
                title: "John Williams",
                fontSize: 14,
                weight: FontWeight.w700,
                textColor: Colors.black,
                align: TextAlign.start,
              ),
              subtitle: TextComponent(
                title: "2 hrs ago / Johor Bahru",
                fontSize: 12,
                weight: FontWeight.w600,
                textColor: Colors.black,
                align: TextAlign.start,
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 50.0, top: 0),
                child: TextComponent(
                  title: "25\$",
                  fontSize: 14,
                  weight: FontWeight.w700,
                  textColor: Colors.black,
                  align: TextAlign.start,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
