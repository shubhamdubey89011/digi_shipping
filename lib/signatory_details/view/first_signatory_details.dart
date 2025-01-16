import 'package:document_fill_demo/controller/toggle_controller.dart';
import 'package:document_fill_demo/signatory_details/controller/signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/view/secod_signatory_details.dart';
import 'package:document_fill_demo/utils/custom_dropdown.dart';
import 'package:document_fill_demo/utils/custom_elevated_button.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/utils/custom_textfield1.dart';
import 'package:document_fill_demo/utils/custom_toggle_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FirstSignatoryDetails extends StatelessWidget {
  final VoidCallback onContinue;
  FirstSignatoryDetails({super.key, required this.onContinue});

  final SignatoryController controller = Get.find<SignatoryController>();
  final CustomToggleController genderController = Get.put(
    CustomToggleController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          AnimatedContainer(
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
                  if (controller.formVisible.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: 'Signatory Details',
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(78, 77, 77, 1),
                          fontSize: 14,
                        ),
                        IconButton(
                          onPressed: controller.toggleFormVisibility,
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  if (controller.formVisible.value) ...[
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
                        controller: Get.find<SignatoryController>()),
                    const SizedBox(height: 10),
                    appTextField(
                      context: context,
                      controller: controller.emailController,
                      focusNode: controller.emailFocusNode,
                      cursorHeight: 12,
                      enabled: true,
                      errorMessage: controller.emailError.value.isNotEmpty
                          ? controller.emailError.value
                          : null,
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email *',
                      onChanged: (value) {
                        controller.email.value = value;
                        controller.validateEmail();
                      },
                    ),
                    const SizedBox(height: 10),
                    appTextField(
                      context: context,
                      controller: controller.mobileNumberController,
                      focusNode: controller.mobileNumberFocusNode,
                      cursorHeight: 12,
                      enabled: true,
                      errorMessage:
                          controller.mobileNumberError.value.isNotEmpty
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
                      controller: controller.relationshipController,
                      focusNode: controller.relationshipFocusNode,
                      cursorHeight: 12,
                      enabled: true,
                      keyboardType: TextInputType.text,
                      errorMessage:
                          controller.relationshipError.value.isNotEmpty
                              ? controller.relationshipError.value
                              : null,
                      labelText: 'Relationship of the Party *',
                      onChanged: (value) {
                        controller.relationship.value = value;
                        controller.validateRelationship();
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          height: 42,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Color(0xFF8DBCD3), width: 1),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );

                              if (selectedDate != null) {
                                print(
                                    "Selected date: ${selectedDate.toLocal()}");
                              }
                            },
                            icon: Icon(Icons.calendar_month),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: 'Date of Birth of the signatory or ',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4E4D4D)),
                            customText(
                                text: 'date of incorporation of the ',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4E4D4D)),
                            customText(
                                text: 'company in case of non-individual ',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4E4D4D)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    customDropdown2(
                        context: context,
                        controller: Get.find<SignatoryController>()),
                    const SizedBox(height: 15),
                    buildToggleSection(
                      context: context,
                      controller: genderController,
                      labels: ['Male', 'Female'],
                      onValueChanged: (index) {
                        controller.maleorfemale.value = index;
                      },
                    ),
                    const SizedBox(height: 20),
                  ] else ...[
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
                              text: 'Signatory Details',
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(78, 77, 77, 1),
                              fontSize: 14,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: SvgPicture.asset('assets/icons/delete.svg'),
                              onPressed: controller.deleteAllDetailsAndOpenForm,
                              tooltip: 'Delete',
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                  'assets/icons/edit_icon.svg'),
                              onPressed: () {
                                controller.formVisible.value = false;
                                controller.editDetails();
                              },
                              tooltip: 'Edit',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          if (controller.secondFormVisible.value)
            SecondSignatoryDetails(onContinue: onContinue),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: 'Add Signatory Details',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                IconButton(
                  onPressed: controller.toggleSecondForm,
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
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
        ],
      );
    });
  }
}
