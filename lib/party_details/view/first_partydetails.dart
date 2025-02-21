import 'package:document_fill_demo/constants/assets_constants.dart';
import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FirstPartyDetailsCard extends StatelessWidget {
  final VoidCallback onContinue;

  FirstPartyDetailsCard({
    super.key,
    required this.onContinue,
  });

  final PartyDetailsController controller = Get.find<PartyDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RmiWidgetHelper.rmiAnimatedContainer(
        child: RmiWidgetHelper.rmiColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          childrens: [
            Visibility(
              visible: controller.formVisible.value,
              child: RmiWidgetHelper.rmiText(
                text: AppStrings.addFirstPartyDetails,
                color: ColorConstants.fontGrey,
              ),
            ),
            RmiWidgetHelper.verticalSpacer(10),
            if (controller.formVisible.value) ...[
              RmiWidgetHelper.appTextField(
                controller: controller.firstPartyNameController,
                labelText: AppStrings.name,
                context: context,
                textCapitalization: TextCapitalization.words,
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
              RmiWidgetHelper.rmiRow(
                childrens: [
                  Expanded(
                    flex: 2,
                    child: RmiWidgetHelper.rmiDropDown1(
                      items: proofs,
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
                      controller: controller.firstPartyIdProofController,
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
                ],
              ),
              RmiWidgetHelper.verticalSpacer(10),
              RmiWidgetHelper.appTextField(
                context: context,
                controller: controller.firstPartyMobileNumberController,
                focusNode: controller.mobileNumberFocusNode,
                errorMessage: controller.mobileNumberError.value.isNotEmpty
                    ? controller.mobileNumberError.value
                    : null,
                keyboardType: TextInputType.phone,
                labelText: AppStrings.mobNumber,
                onChanged: (value) {
                  controller.mobileNumber.value = value;
                  controller.validatemobileNumberField();
                },
              ),
              RmiWidgetHelper.verticalSpacer(10),
              RmiWidgetHelper.appTextField(
                context: context,
                controller: controller.firstPartyPinCodeController,
                focusNode: controller.pinCodeFocusNode,
                keyboardType: TextInputType.number,
                errorMessage: controller.pinCodeError.value.isNotEmpty
                    ? controller.pinCodeError.value
                    : null,
                labelText: AppStrings.pinCode,
                onChanged: (value) {
                  controller.pinCode.value = value;
                  controller.validatepinCodeField();
                },
              ),
              RmiWidgetHelper.verticalSpacer(20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: RmiWidgetHelper.customElevatedButton(
                  context: context,
                  color: ColorConstants.buttonColor,
                  textColor: ColorConstants.backgroundWhite,
                  text: AppStrings.continueButton,
                  isEnabled: controller.isDetailsReadyToSubmit(),
                  onPressed: () {
                    controller.handleFormSubmission();
                    controller.formVisible.value = false;
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
                        Icons.check_circle_outline,
                        color: ColorConstants.checkMark,
                      ),
                      RmiWidgetHelper.rmiText(
                        text: AppStrings.firstPartyDetails,
                        color: ColorConstants.fontGrey,
                      ),
                      RmiWidgetHelper.horizontalSpacer(40.0),
                      RmiWidgetHelper.rmiIconButton(
                        icon: SvgPicture.asset(
                          AssetsConstants.delete,
                        ),
                        onPressed: controller.deleteAllDetailsAndOpenForm,
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
            ]
          ],
        ),
      );
    });
  }
}
