import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:flutter/material.dart';

Widget customElevatedButton({
  required String text,
  required VoidCallback onPressed,
  Color? color,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
  BorderRadius? borderRadius,
  required bool isEnabled
}) {
  return SizedBox(
    width: 200,
    child: ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled == true ?  Color(0xFF3700B3)
                            : Color.fromRGBO(78, 77, 77, 1),
        padding: padding ??
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black)),
      ),
      child: customText(text: text,color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),
    ),
  );
}
