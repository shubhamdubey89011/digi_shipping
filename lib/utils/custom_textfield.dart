import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customTextField({
  required String labelText,
  String? hintText,
  TextEditingController? controller,
  TextInputType? keyboardType,
  bool obscureText = false,
  IconData? prefixIcon,
  Icon? suffixIcon,
  Function(String)? onChanged,
  String? Function(String?)? validator,
  TextStyle? style,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    onChanged: onChanged,
    validator: validator,
    style: GoogleFonts.plusJakartaSans(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: GoogleFonts.plusJakartaSans(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      hintText: hintText,
      floatingLabelStyle: GoogleFonts.plusJakartaSans(
        color: Color.fromRGBO(78, 77, 77, 1), 
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color.fromRGBO(141, 188, 211, 1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color.fromRGBO(141, 188, 211, 1)),
        gapPadding: 8.0, 
      ),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null ? Icon(Icons.arrow_forward_ios) : null,
    ),
  );
}
