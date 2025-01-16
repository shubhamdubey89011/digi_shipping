import 'package:document_fill_demo/controller/toggle_controller.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomToggleButtons extends StatelessWidget {
  final List<String> labels;
  final CustomToggleController controller;
  final ValueChanged<int> onValueChanged;
  

  CustomToggleButtons({
    required this.labels,
    required this.controller,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          labels.length,
          (index) => GestureDetector(
            onTap: () {
              controller.updateSelectedValue(index);
              onValueChanged(index);
            },
            child: Container(
              
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: controller.selectedValue.value == index
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: controller.selectedValue.value == index
                      ? Colors.blue
                      : Colors.transparent,
                ),
              ),
              child: customText(
               text:  labels[index],
                color: controller.selectedValue.value == index
                      ? Color(0xFF4E4D4D)
                      : Colors.black,
                      fontSize: 12,fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

    Widget buildToggleSection({
    // required String title,
    required CustomToggleController controller,
    required List<String> labels,
    required ValueChanged<int> onValueChanged,
    required BuildContext context,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 244, 245, 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: CustomToggleButtons(
        labels: labels,
        controller: controller,
        onValueChanged: onValueChanged,
      ),
    );
  }
}