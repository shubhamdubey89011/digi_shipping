import 'package:flutter/material.dart';

Widget customContainer({
  required Widget child,
  double? width,
  double? height,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  Color? color,
  BorderRadiusGeometry? borderRadius,
  BoxBorder? border,
  BoxShadow? boxShadow,
}) {
  return Container(
    width: width,
    height: height,
    padding: padding,
    margin: margin,
    decoration: BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      border: border,
      boxShadow: boxShadow != null ? [boxShadow] : null,
    ),
    child: child,
  );
}
