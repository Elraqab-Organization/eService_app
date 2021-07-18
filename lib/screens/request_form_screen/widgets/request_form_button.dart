import 'package:e_service_app/providers/requests/requests_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestFormButtons extends StatelessWidget {
  final Function onClick;
  final data;

  const RequestFormButtons({this.onClick, this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(249, 112, 104, 1),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Consumer(
            builder: (context, watch, child) => ElevatedButton(
              onPressed: () => watch(makeRequestProvider(data)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(249, 112, 104, 1),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
    );
  }
}
