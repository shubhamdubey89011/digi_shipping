import 'package:document_fill_demo/common_controller/toggle_controller.dart';
import 'package:document_fill_demo/constants/assets_constants.dart';
import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/constants/dimensions.dart';
import 'package:document_fill_demo/signatory_details/controller/second_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/controller/signatory_controller.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SecondSignatoryDetails extends StatelessWidget {
  SecondSignatoryDetails({super.key, required this.onContinue});

  final VoidCallback onContinue;
  final SecondSignatoryController secondController =
      Get.find<SecondSignatoryController>();

  final CustomToggleController genderController =
      Get.put(CustomToggleController());

  SignatoryController firstController = Get.find<SignatoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RmiWidgetHelper.rmiAnimatedContainer(
        child: RmiWidgetHelper.rmiColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          childrens: [
            Visibility(
              visible: secondController.formVisible.value,
              child: RmiWidgetHelper.rmiText(
                text: AppStrings.secondSignatoryDetails,
                color: ColorConstants.fontGrey,
              ),
            ),
            RmiWidgetHelper.verticalSpacer(10),
            if (secondController.formVisible.value ) ...[
              RmiWidgetHelper.appTextField(
                controller: secondController.nameController,
                labelText: 'Name *',
                context: context,
                cursorHeight: 12,
                enabled: true,
                errorMessage: secondController.nameError.value.isNotEmpty
                    ? secondController.nameError.value
                    : null,
                focusNode: secondController.nameFocusNode,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  secondController.name.value = value;
                  secondController.validateNameField();
                },
              ),
              RmiWidgetHelper.verticalSpacer(8),
              RmiWidgetHelper.rmiRow(childrens: [
                Expanded(
                  flex: 2,
                  child: RmiWidgetHelper.rmiDropDown1(
                    value: secondController.selectedProof.value.toString(),
                    onDropDownChanged: (value) {
                      print(value);

                      if (value != null) {
                        secondController.selectedProof.value = value;
                        secondController.validateidProofNumberField();
                      }
                      debugPrint(
                          "Error: ${secondController.idProofNumberError.value}");
                    },
                    items: proofs,
                    error: secondController.idProofNumberError.value.isNotEmpty,
                    errorMessage: secondController.idProofNumberError.value,
                  ),
                ),
                RmiWidgetHelper.horizontalSpacer(10),
                Expanded(
                  flex: 3,
                  child: RmiWidgetHelper.appTextField(
                    focusNode: secondController.idProofFocusNode,
                    context: context,
                    controller: secondController.idProofController,
                    onChanged: (value) {
                      secondController.idProofNumber.value = value.toString();
                      secondController.validateidProofNumberField();
                    },
                    hintText: 'ID Proof*',
                    labelText: 'ID Proof Number *',
                    textCapitalization: TextCapitalization.characters,
                    errorMessage:
                        secondController.idProofNumberError.value.isNotEmpty
                            ? secondController.idProofNumberError.value
                            : null,
                  ),
                ),
              ]),
              RmiWidgetHelper.verticalSpacer(10),
              RmiWidgetHelper.appTextField(
                context: context,
                controller: secondController.emailController,
                focusNode: secondController.emailFocusNode,
                cursorHeight: 12,
                enabled: true,
                errorMessage: secondController.emailError.value.isNotEmpty
                    ? secondController.emailError.value
                    : null,
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email *',
                onChanged: (value) {
                  secondController.email.value = value;
                  secondController.validateEmail();
                },
              ),
              const SizedBox(height: 10),
              RmiWidgetHelper.appTextField(
                context: context,
                controller: secondController.mobileNumberController,
                focusNode: secondController.mobileNumberFocusNode,
                cursorHeight: 12,
                enabled: true,
                errorMessage:
                    secondController.mobileNumberError.value.isNotEmpty
                        ? secondController.mobileNumberError.value
                        : null,
                keyboardType: TextInputType.phone,
                labelText: 'Mobile Number *',
                onChanged: (value) {
                  secondController.mobileNumber.value = value;
                  secondController.validatemobileNumberField();
                },
              ),
              const SizedBox(height: 10),
              RmiWidgetHelper.appTextField(
                context: context,
                controller: secondController.relationshipController,
                focusNode: secondController.relationshipFocusNode,
                cursorHeight: 12,
                enabled: true,
                keyboardType: TextInputType.text,
                errorMessage:
                    secondController.relationshipError.value.isNotEmpty
                        ? secondController.relationshipError.value
                        : null,
                labelText: 'Relationship of the Party *',
                onChanged: (value) {
                  secondController.relationship.value = value;
                  secondController.validateRelationship();
                  if (secondController.relationship.value.isNotEmpty &&
                      secondController.name.value.isNotEmpty) {}
                },
              ),
              const SizedBox(height: 15),
              RmiWidgetHelper.rmiRow(
                mainAxisAlignment: MainAxisAlignment.start,
                childrens: [
                  Container(
                    height: SizeConfig.height(context, 0.05),
                    width: SizeConfig.width(context, 0.12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: ColorConstants.toggleBorder, width: 1),
                    ),
                    child: RmiWidgetHelper.rmiIconButton(
                      onPressed: () async {
                        await secondController.pickDate(context);
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  ),
                  RmiWidgetHelper.horizontalSpacer(20),
                  Obx(() {
                    return secondController.selectedDate.value == null
                        ? RmiWidgetHelper.rmiColumn(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            childrens: [
                              RmiWidgetHelper.rmiText(
                                text: 'Date of Birth of the signatory or ',
                                color: ColorConstants.fontDarkGrey,
                              ),
                              RmiWidgetHelper.rmiText(
                                text: 'date of incorporation of the ',
                                color: ColorConstants.fontDarkGrey,
                              ),
                              RmiWidgetHelper.rmiText(
                                text: 'company in case of non-individual ',
                                color: ColorConstants.fontDarkGrey,
                              ),
                            ],
                          )
                        : RmiWidgetHelper.rmiContainer(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: ColorConstants.toggleBorder, width: 1),
                              color: ColorConstants.backgroundWhite,
                            ),
                            child: RmiWidgetHelper.rmiText(
                              text:
                                  "${secondController.selectedDate.value!.day}/${secondController.selectedDate.value!.month}/${secondController.selectedDate.value!.year}",
                              color: ColorConstants.fontDarkGrey,
                            ),
                          );
                  }),
                ],
              ),
              const SizedBox(height: 15),
              RmiWidgetHelper.rmiDropDown2(
                  context: context,
                  controller: Get.find<SecondSignatoryController>()),
              const SizedBox(height: 15),
              RmiWidgetHelper.buildToggleSection(
                context: context,
                controller: genderController,
                labels: ['Male', 'Female'],
                onValueChanged: (index) {
                  secondController.maleorfemale.value = index;
                },
              ),
              RmiWidgetHelper.verticalSpacer(20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: RmiWidgetHelper.customElevatedButton(
                  color: ColorConstants.buttonColor,
                  context: context,
                  text: AppStrings.continueButton,
                  textColor: ColorConstants.backgroundWhite,
                  isEnabled: secondController.isDetailsReadyToSubmit(),
                  onPressed: () {
                    secondController.handleFormSubmission();
                    secondController.formVisible.value = false;
                  },
                ),
              ),
            ] else ...[
              Visibility(
                visible: !secondController.formVisible.value ,
                child: RmiWidgetHelper.rmiRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    childrens: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: ColorConstants.checkMark,
                      ),
                      RmiWidgetHelper.rmiText(
                        text: AppStrings.secondSignatoryDetails,
                        color: ColorConstants.fontGrey,
                      ),
                      RmiWidgetHelper.horizontalSpacer(25.0),
                      RmiWidgetHelper.rmiIconButton(
                        icon: SvgPicture.asset(
                          AssetsConstants.delete,
                        ),
                        onPressed: () {
                          secondController.deleteAllDetailsAndOpenForm();
                          secondController.clearDate();
                        },
                      ),
                      RmiWidgetHelper.rmiIconButton(
                        icon: SvgPicture.asset(AssetsConstants.edit),
                        onPressed: () {
                          secondController.formVisible.value = true;
                          secondController.isEditing.value = true;
                          secondController.editDetails();
                        },
                      ),
                    ]),
              ),
            ]
          ],
        ),
      );
    });
  }
}
