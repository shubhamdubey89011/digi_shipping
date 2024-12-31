import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:flutter/material.dart';

Widget buildToggleGroup({
  required List<String> labels,
  required int selectedValue,
  required ValueChanged<int> onValueChanged,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromRGBO(242, 244, 245, 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: List.generate(labels.length, (index) {
        return _buildToggleButton(
          labels[index],
          selectedValue == index,
          () => onValueChanged(index),
        );
      }),
    ),
  );
}

Widget _buildToggleButton(
    String label, bool isSelected, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected
                  ? Color.fromRGBO(141, 188, 211, 1)
                  : Colors.transparent),
        ),
        child: customText(
            text: label,
            color: isSelected ? Colors.black : Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w600)),
  );
}
