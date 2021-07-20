import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  final bool isCustomer;
  final data;
  const HeaderContent({
    this.isCustomer,
    this.data,
    Key key,
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
                backgroundImage: NetworkImage(
                  isCustomer
                      ? data.customer.imgSrc
                      : data.serviceProvider.imgSrc,
                ),
              ),
              title: TextComponent(
                title: isCustomer
                    ? "${data.serviceProvider.firstName} ${data.serviceProvider.lastName}"
                    : "${data.customer.firstName} ${data.customer.lastName}",
                fontSize: 14,
                weight: FontWeight.w700,
                textColor: Colors.black,
                align: TextAlign.start,
              ),
              subtitle: TextComponent(
                title: "${data.responseTime} / ${data.location}",
                fontSize: 12,
                weight: FontWeight.w600,
                textColor: Colors.black,
                align: TextAlign.start,
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 50.0, top: 0),
                child: TextComponent(
                  title: "${data.serviceFees}\$",
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
