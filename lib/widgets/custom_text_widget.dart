// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  int? maxLines;
  CustomTextWidget(
      {super.key,
      this.fontSize,
      this.fontWeight,
      required this.text,
      this.textColor,
      this.textAlign,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 10,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: textColor ?? Colors.black,
      ),
    );
  }
}
