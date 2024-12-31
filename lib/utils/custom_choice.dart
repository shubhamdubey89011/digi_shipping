// import 'package:document_fill_demo/controller/choice_cip_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
// import 'package:get/get.dart';

// class Reusable3DChoiceChip extends StatelessWidget {
//   final List<String> options;
//   final ChoiceChip3DStyle style;

//   const Reusable3DChoiceChip({
//     Key? key,
//     required this.options,
//     this.style = ChoiceChip3DStyle.blue,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<ChoiceChipController>();

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
//         options.length,
//         (index) => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Obx(
//             () => ChoiceChip3D(
//               style: style,
//               onSelected: () => controller.updateSelection(index),
//               onUnSelected: () => null,
//               selected: controller.selectedIndex.value == index,
//               child: Text(options[index]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:document_fill_demo/controller/choice_cip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReusableToggle extends StatelessWidget {
  final List<String> options;
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;
  final TextStyle activeTextStyle;
  final TextStyle inactiveTextStyle;

  const ReusableToggle({
    Key? key,
    required this.options,
    this.width = 100.0,
    this.height = 50.0,
    this.activeColor = Colors.white70,
    this.inactiveColor = Colors.white38,
    this.activeTextStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    this.inactiveTextStyle = const TextStyle(color: Colors.black),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ToggleController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        options.length,
        (index) => GestureDetector(
          onTap: () => controller.updateSelection(index),
          child: Obx(
            () => Container(
              width: width,
              height: height,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == index ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                options[index],
                style: controller.selectedIndex.value == index ? activeTextStyle : inactiveTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

