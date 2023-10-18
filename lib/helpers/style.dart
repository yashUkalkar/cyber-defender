import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var size, height, width;

class SizingCalc extends StatelessWidget {
  const SizingCalc({super.key});

  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container();
  }
}

class AppColors {
  static final primary = Color.fromARGB(255, 2, 17, 28);
  static final accent = Colors.blue[500];
  static final text = Colors.white;
  static final dark = Colors.black;
  static final error = Colors.redAccent[700];
}

// Text widget with custom styling
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.titleFont = false,
    this.defaultFont = false,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.white,
    this.letterSpacing = 0.0,
    this.alignment = TextAlign.center,
  });
  final String text;
  final bool titleFont;
  final bool defaultFont;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double letterSpacing;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    final textStyle;
    if (this.titleFont) {
      textStyle = GoogleFonts.michroma(
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: this.color,
        letterSpacing: this.letterSpacing,
      );
    } else if (this.defaultFont) {
      textStyle = TextStyle(
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: this.color,
        letterSpacing: this.letterSpacing,
      );
    } else {
      textStyle = GoogleFonts.montserrat(
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: this.color,
        letterSpacing: this.letterSpacing,
      );
    }

    return Text(
      this.text,
      style: textStyle,
      textAlign: this.alignment,
    );
  }
}
