import 'package:flutter/material.dart';

Widget customButton({
  required String text,
  required VoidCallback onPressed,
  Color? color,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      backgroundColor: color,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    ),
    child: Text(
      text,
      style: textStyle ?? const TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}
