import 'package:e_service_app/components/cards_proposals.dart';
import 'package:flutter/material.dart';

class CustomerProposalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(children: [
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "current",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/proposals_list");
                },
                child: Text(
                  "history",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CardProposal(),
        )
      ]),
    );
  }
}
