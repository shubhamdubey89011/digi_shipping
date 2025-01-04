import 'package:document_fill_demo/controller/toggle_controller.dart';
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
                    ? Colors.blue
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: controller.selectedValue.value == index
                      ? Colors.blue
                      : Colors.grey,
                ),
              ),
              child: Text(
                labels[index],
                style: TextStyle(
                  color: controller.selectedValue.value == index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}