  import 'package:document_fill_demo/controller/toggle_controller.dart';
import 'package:document_fill_demo/utils/custom_toggle.dart';
import 'package:flutter/material.dart';

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