import 'package:flutter/material.dart';

Widget customMaterial({
  required Widget child,
}) {
  return Material(
    type: MaterialType.card,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color.fromRGBO(141, 188, 211, 1),
        )),
        child: child,
  );
}
