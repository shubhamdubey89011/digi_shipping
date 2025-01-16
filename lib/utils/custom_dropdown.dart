import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/utils/custom_textfield1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget customDropdown({
  required BuildContext context,
  required dynamic controller, // Accepts either controller
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Obx(
              () => Container(
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(141, 188, 211, 1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                  focusColor: Colors.transparent,
                  isExpanded: true,
                  underline: const SizedBox(),
                  value: controller.selectedProof.value.isEmpty
                      ? (proofs.isNotEmpty
                          ? proofs[0]
                          : null) // Ensure it's not empty
                      : controller.selectedProof.value,
                  items: proofs.map((proof) {
                    return DropdownMenuItem<String>(
                      value: proof,
                      child: customText(
                        text: proof,
                        color: const Color.fromRGBO(78, 77, 77, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedProof.value = value;
                      controller.validateidProofNumberField();
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 42,
              child: appTextField(
                context: context,
                controller: controller.idProofController,
                focusNode: controller.idProofFocusNode,
                cursorHeight: 12,
                enabled: true,
                keyboardType: TextInputType.number,
                labelText: 'ID Proof Number *',
                onChanged: (value) {
                  controller.idProofNumber.value = value;
                  controller.validateidProofNumberField();
                },
              ),
            ),
          ),
        ],
      ),
      Obx(() {
        return controller.idProofNumberError.value.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 5),
                child: customText(
                  text: controller.idProofNumberError.value,
                  color: Colors.red,
                  fontSize: 12,
                ),
              )
            : SizedBox.shrink();
      }),
    ],
  );
}

Widget customDropdown2({
  required BuildContext context,
  required dynamic controller, // Accepts either controller
}) {
  return Obx(
    () => Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(141, 188, 211, 1),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        icon: SvgPicture.asset('assets/icons/dropdown.svg'),
        focusColor: Colors.transparent,
        isExpanded: true,
        underline: const SizedBox(),
        value: controller.selectedParty.value.isEmpty
            ? (party.isNotEmpty ? party[0] : null)
            : controller.selectedParty.value,
        items: party.map((party) {
          return DropdownMenuItem<String>(
            value: party,
            child: customText(
              text: party,
              color: const Color.fromRGBO(78, 77, 77, 1),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            controller.selectedParty.value = value;
            controller.validateParty();
          }
        },
      ),
    ),
  );
}
