import 'package:flutter/material.dart';

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
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    onChanged: onChanged,
    validator: validator,
style: style,
    decoration: InputDecoration(
      labelText: labelText,labelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null ? Icon(Icons.arrow_forward_ios) : null,
    ),
  );
}
