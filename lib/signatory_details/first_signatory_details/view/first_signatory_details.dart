import 'package:document_fill_demo/common_controller/toggle_controller.dart';
import 'package:document_fill_demo/constants/assets_constants.dart';
import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/constants/dimensions.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/signatory_details/second_signatory/controller/second_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/first_signatory_details/controller/first_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/second_signatory/view/secod_signatory_details.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FirstSignatoryDetails extends StatelessWidget {
  final VoidCallback onContinue;

  FirstSignatoryDetails({super.key, required this.onContinue});

  final FirstSignatoryController controller =
      Get.find<FirstSignatoryController>();
  final PartyDetailsController partyController =
      Get.find<PartyDetailsController>();
  final CustomToggleController genderController =
      Get.put(CustomToggleController());

  final SecondSignatoryController secondController =
      Get.find<SecondSignatoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RmiWidgetHelper.rmiColumn(childrens: [
        RmiWidgetHelper.rmiAnimatedContainer(
          child: RmiWidgetHelper.rmiColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            childrens: [
              Visibility(
                visible: controller.formVisible.value,
                child: RmiWidgetHelper.rmiText(
                  text: AppStrings.signatoryDetails,
                  color: ColorConstants.fontGrey,
                ),
              ),
              if (controller.formVisible.value) ...[
                RmiWidgetHelper.verticalSpacer(10),
                RmiWidgetHelper.appTextField(
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
                RmiWidgetHelper.verticalSpacer(8),
                RmiWidgetHelper.rmiRow(childrens: [
                  Expanded(
                    flex: 2,
                    child: RmiWidgetHelper.rmiDropDown1(
                      value: controller.selectedProof.value.toString(),
                      onDropDownChanged: (value) {
                        print(value);

                        if (value != null) {
                          controller.selectedProof.value = value;
                          controller.validateidProofNumberField();
                        }
                        debugPrint(
                            "Error: ${controller.idProofNumberError.value}");
                      },
                      items: proofs,
                      error: controller.idProofNumberError.value.isNotEmpty,
                      errorMessage: controller.idProofNumberError.value,
                    ),
                  ),
                  RmiWidgetHelper.horizontalSpacer(10),
                  Expanded(
                    flex: 3,
                    child: RmiWidgetHelper.appTextField(
                      focusNode: controller.idProofFocusNode,
                      context: context,
                      controller: controller.idProofController,
                      onChanged: (value) {
                        controller.idProofNumber.value = value.toString();
                        controller.validateidProofNumberField();
                      },
                      hintText: 'ID Proof*',
                      labelText: 'ID Proof Number *',
                      textCapitalization: TextCapitalization.characters,
                      errorMessage:
                          controller.idProofNumberError.value.isNotEmpty
                              ? controller.idProofNumberError.value
                              : null,
                    ),
                  ),
                ]),
                RmiWidgetHelper.verticalSpacer(10),
                RmiWidgetHelper.appTextField(
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
                RmiWidgetHelper.appTextField(
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
                RmiWidgetHelper.appTextField(
                  context: context,
                  controller: controller.relationshipController,
                  focusNode: controller.relationshipFocusNode,
                  cursorHeight: 12,
                  enabled: true,
                  keyboardType: TextInputType.text,
                  errorMessage: controller.relationshipError.value.isNotEmpty
                      ? controller.relationshipError.value
                      : null,
                  labelText: 'Relationship of the Party *',
                  onChanged: (value) {
                    controller.relationship.value = value;
                    controller.validateRelationship();
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
                          await controller.pickDate(context);
                        },
                        icon: Icon(Icons.calendar_month),
                      ),
                    ),
                    RmiWidgetHelper.horizontalSpacer(20),
                    Obx(() {
                      return controller.selectedDate.value == null
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
                                    color: ColorConstants.toggleBorder,
                                    width: 1),
                                color: ColorConstants.backgroundWhite,
                              ),
                              child: RmiWidgetHelper.rmiText(
                                text:
                                    "${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}",
                                color: ColorConstants.fontDarkGrey,
                              ),
                            );
                    }),
                  ],
                ),
                const SizedBox(height: 15),
                RmiWidgetHelper.rmiDropDown1(
                  value: controller.selectedParty.value.toString(),
                  hint: RmiWidgetHelper.rmiText(text: 'Party Type*'),
                  onDropDownChanged: (value) {
                    print("Party type  $value");

                    if (value != null) {
                      controller.selectedParty.value = value;
                    }
                  },
                  items: party,
                  error: controller.partyError.value.isNotEmpty,
                  errorMessage: controller.partyError.value,
                ),
                const SizedBox(height: 15),
                RmiWidgetHelper.buildToggleSection(
                  context: context,
                  controller: genderController,
                  labels: ['Male', 'Female'],
                  onValueChanged: (index) {
                    controller.maleorfemale.value = index;
                  },
                ),
                RmiWidgetHelper.verticalSpacer(20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: RmiWidgetHelper.customElevatedButton(
                    context: context,
                    text: AppStrings.continueButton,
                    color: ColorConstants.buttonColor,
                    textColor: ColorConstants.backgroundWhite,
                    isEnabled: controller.isDetailsReadyToSubmit(),
                    onPressed: () {
                      controller.handleFormSubmission();
                      controller.formVisible.value = false;
                      controller.checkSecondSignatory();
                    },
                  ),
                ),
              ] else ...[
                Visibility(
                  visible: !controller.formVisible.value,
                  child: RmiWidgetHelper.rmiRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      childrens: [
                        const Icon(
                          Icons.check_circle,
                          color: ColorConstants.checkMark,
                        ),
                        RmiWidgetHelper.rmiText(
                          text: AppStrings.firstSignatoryDetails,
                          color: ColorConstants.fontGrey,
                        ),
                        RmiWidgetHelper.horizontalSpacer(40.0),
                        RmiWidgetHelper.rmiIconButton(
                          icon: SvgPicture.asset(
                            AssetsConstants.delete,
                          ),
                          onPressed: () {
                            controller.deleteAllDetailsAndOpenForm();
                            controller.clearDate();
                            controller.maleorfemale.value = -1;
                            controller.update();
                          },
                        ),
                        RmiWidgetHelper.rmiIconButton(
                          icon: SvgPicture.asset(AssetsConstants.edit),
                          onPressed: () {
                            controller.formVisible.value = true;
                            controller.isEditing.value = true;
                            controller.editDetails();
                          },
                        ),
                      ]),
                ),
              ],
            ],
          ),
        ),
      ]);
    });
  }
}
