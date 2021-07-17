import 'package:e_service_app/components/rounded_rectangle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestFormButtons extends StatelessWidget {
  final Function onClick;

  const RequestFormButtons({this.onClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(33, 39, 56, 1),
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
          ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(33, 39, 56, 1),
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
          SizedBox(
            width: 20.0,
          )
        ],
      ),
    );
  }
}
