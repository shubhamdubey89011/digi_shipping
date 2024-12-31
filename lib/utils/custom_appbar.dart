import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget customAppBar({
  required String title,
  String? subtitle,
  List<Widget>? actions,
  bool centerTitle = true,
  Color? backgroundColor,
  Widget? leading,
  PreferredSizeWidget? bottom,
  double elevation = 4.0,
}) {
  return AppBar(toolbarHeight: 58,clipBehavior: Clip.antiAlias,titleSpacing: 10,
    bottom: bottom,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment:
              centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            customText(text: title,color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
            
            if (subtitle != null)
            customText(text: subtitle ,color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
              
          ],
        ),
      ],
    ),
    actions: actions ??
        [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/notification_icon.svg', // Replace with your SVG file path
              height: 27,
              width: 18,
              color: Colors.black, // Optional: Change the color of the SVG
            ),
            onPressed: () {
              // Handle notification action
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/ham_burger.svg', // Replace with your SVG file path
              height: 20,
              width: 20,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
    centerTitle: centerTitle,
    backgroundColor: backgroundColor ?? const Color.fromRGBO(240, 238, 255, 1),
    leading: leading ??
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Back action
            Get.back();
          },
        ),
    elevation: elevation,
  );
}
