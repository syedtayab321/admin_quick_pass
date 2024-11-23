import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size,spacing;
  final FontWeight? weight;
  final TextAlign ? align;
  final double? height;
  final TextOverflow? flow;
  final int? maxlines;
  const CustomTextWidget({
    required this.title,
    this.color,
    this.size,
    this.weight,
    this.spacing,
    this.align,
    this.height,
    this.flow,
    this.maxlines,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: spacing,
        height: height,
      ),
      overflow: flow,
      maxLines: maxlines,
    );
  }
}