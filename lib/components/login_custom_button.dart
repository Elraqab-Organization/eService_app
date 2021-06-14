import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtomLogin extends StatelessWidget {
  //
  String imageUrl;
  bool hasImage;
  String buttonText;
  Color buttonColor;
  Color buttonTextColor;

  CustomButtomLogin(this.buttonColor, this.buttonText, this.buttonTextColor,
      this.imageUrl, this.hasImage);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("clicked");
        },
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              hasImage
                  ? SizedBox(
                      width: 35,
                      height: 40,
                      child: Image.network(imageUrl),
                    )
                  : SizedBox(),
              SizedBox(
                width: 7,
              ),
              Text(
                buttonText,
                style: GoogleFonts.openSans(
                    color: buttonTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ],
              color: buttonColor,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(width: 0)),
        ));
  }
}
