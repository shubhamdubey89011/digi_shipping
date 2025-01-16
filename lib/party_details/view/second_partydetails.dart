import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/party_details/controller/second_party_detailscontroller.dart';
import 'package:document_fill_demo/utils/custom_dropdown.dart';
import 'package:document_fill_demo/utils/custom_elevated_button.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/utils/custom_textfield1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SecondPartyDetailsCard extends StatelessWidget {
  final VoidCallback onContinue;

  SecondPartyDetailsCard({
    super.key,
    required this.onContinue,
  });

  final SecondPartyDetailscontroller controller =
      Get.find<SecondPartyDetailscontroller>();

      final FirstPartyDetailsController firstController = Get.find<FirstPartyDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // bool isFormEnabled = firstController.isFirstPartyFormSubmitted.value;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.formVisible.value )
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: 'Add Second Party Details',
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(78, 77, 77, 1),
                      fontSize: 14,
                    ),

                    IconButton(onPressed: controller.toggleFormVisibility, 
                    icon: Icon(Icons.close),
                    
                    ),
                  ],
                ),
              const SizedBox(height: 10),
              if (controller.formVisible.value ) ...[
                // Form Section
                appTextField(
                  controller: controller.nameController,
                  labelText: 'Name *',
                  context: context,
                  cursorHeight: 12,
                  enabled: true,
                  errorMessage: controller.nameError.value.isNotEmpty
                      ? controller.nameError.value
                      : null,
                  focusNode: controller.nameFocusNode,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateNameField();
                  },
                ),
                const SizedBox(height: 8),
                customDropdown(
                    context: context,
                    controller: Get.find<SecondPartyDetailscontroller>()),
                const SizedBox(height: 10),
                appTextField(
                  context: context,
                  controller: controller.mobileNumberController,
                  focusNode: controller.mobileNumberFocusNode,
                  cursorHeight: 12,
                  enabled: true,
                  errorMessage: controller.mobileNumberError.value.isNotEmpty
                      ? controller.mobileNumberError.value
                      : null,
                  keyboardType: TextInputType.phone,
                  labelText: 'Mobile Number *',
                  onChanged: (value) {
                    controller.mobileNumber.value = value;
                    controller.validatemobileNumberField();
                  },
                ),
                const SizedBox(height: 10),
                appTextField(
                  context: context,
                  controller: controller.pinCodeController,
                  focusNode: controller.pinCodeFocusNode,
                  cursorHeight: 12,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  errorMessage: controller.pinCodeError.value.isNotEmpty
                      ? controller.pinCodeError.value
                      : null,
                  labelText: 'Pin Code *',
                  onChanged: (value) {
                    controller.pinCode.value = value;
                    controller.validatepinCodeField();
                  },
                ),
                // const Spacer(),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: customElevatedButton(
                    text: 'Continue',
                    isEnabled: controller.isDetailsReadyToSubmit(),
                    onPressed: () {
                      controller.handleFormSubmission();
                      controller.formVisible.value = false;
                    },
                  ),
                ),
              ] else  ...[
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle_outline,
                              color: Colors.green),
                          const SizedBox(width: 5),
                          customText(
                            text: 'Second Party Details',
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(78, 77, 77, 1),
                            fontSize: 14,
                          ),
                        ],
                      ),
                      // const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset('assets/icons/delete.svg'),
                            onPressed: controller.deleteAllDetailsAndOpenForm,
                            tooltip: 'Delete',
                          ),
                          IconButton(
                            icon:
                                SvgPicture.asset('assets/icons/edit_icon.svg'),
                            onPressed: () {
                              controller.formVisible.value = false;
                              controller.editDetails();
                            },
                            tooltip: 'Edit',
                          ),
                        ],
                      )
                    ],
                  ),
                
              ],
            ],
          ),
        ),
      );
    });
  }
}
