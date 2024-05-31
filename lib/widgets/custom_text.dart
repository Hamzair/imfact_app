import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InterCustomText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color textColor;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  final TextAlign? textAlign;
  const InterCustomText(
      {super.key,
        required this.text,
        required this.textColor,
        this.fontsize,
        required this.fontWeight,
        this.height,
        this.textAlign, this.maxLines, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      maxLines: maxLines,
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
            color: textColor,
            fontSize: fontsize,
            fontWeight: fontWeight,
            height: height),
      ),
    );
  }
}
