import 'package:flutter/material.dart';

Widget customElevatedButton({
  required String text,
  required VoidCallback onPressed,
  Color? color,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
  BorderRadius? borderRadius,
}) {
  return SizedBox(
    width: 200,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: padding ??
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.black)),
      ),
      child: Row(
        children: [
          Text(
            text,
            style:
                textStyle ?? const TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_forward),
        ],
      ),
    ),
  );
}
