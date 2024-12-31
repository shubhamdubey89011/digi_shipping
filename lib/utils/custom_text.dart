import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  required String text,
  TextStyle? style,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? overflow,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return Text(
    text,
    style: GoogleFonts.plusJakartaSans(color: color,fontSize:  fontSize,fontWeight: fontWeight),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,softWrap: false,
  );
}
