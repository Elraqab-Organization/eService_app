import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color textColor;
  final TextAlign align;
  final FontWeight weight;
  TextComponent({
    this.fontSize,
    this.textColor,
    this.title,
    this.align = TextAlign.center,
    this.weight = FontWeight.w900,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: weight,
        ),
      ),
    );
  }
}
