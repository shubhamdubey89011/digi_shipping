import 'package:document_fill_demo/constants/assets_constants.dart';
import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SecondPartyDetailsCard extends StatelessWidget {
  final VoidCallback onContinue;

  SecondPartyDetailsCard({
    super.key,
    required this.onContinue,
  });

  final PartyDetailsController controller = Get.find<PartyDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RmiWidgetHelper.rmiAnimatedContainer(
        padding: controller.secondPartyformVisible.value &&
                controller.isFirstFormCompleted.value ? EdgeInsets.all(10) : EdgeInsets.all(5),
        child: RmiWidgetHelper.rmiColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          childrens: [
            Visibility(
              visible: controller.secondPartyformVisible.value,
              child: RmiWidgetHelper.rmiText(
                text: AppStrings.addSecondPartyDetails,
                color: ColorConstants.fontGrey,
              ),
            ),
           
            if (controller.secondPartyformVisible.value &&
                controller.isFirstFormCompleted.value) ...[
                   const SizedBox(height: 10),
              RmiWidgetHelper.appTextField(
                controller: controller.secondPartyNameController,
                labelText: AppStrings.name,
                context: context,
                errorMessage: controller.secondPartynameError.value.isNotEmpty
                    ? controller.secondPartynameError.value
                    : null,
                focusNode: controller.secondPartynameFocusNode,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.characters,
                onChanged: (value) {
                  controller.secondPartyname.value = value;
                  controller.secondPartyvalidateNameField();
                },
              ),
              RmiWidgetHelper.verticalSpacer(8),
              RmiWidgetHelper.rmiRow(childrens: [
                Expanded(
                  flex: 2,
                  child: RmiWidgetHelper.rmiDropDown1(
                    value: controller.secondPartyselectedProof.value.toString(),
                    items: proofs,
                    onDropDownChanged: (value) {
                      print(value);

                      controller.secondPartyselectedProof.value =
                          value.toString();
                      controller.secondPartyvalidateidProofNumberField();
                      debugPrint(
                          "Error: ${controller.secondPartyidProofNumberError.value}");
                    },
                    error: controller
                        .secondPartyidProofNumberError.value.isNotEmpty,
                    errorMessage:
                        controller.secondPartyidProofNumberError.value,
                  ),
                ),
                RmiWidgetHelper.horizontalSpacer(10),
                Expanded(
                  flex: 3,
                  child: RmiWidgetHelper.appTextField(
                    focusNode: controller.secondPartyidProofFocusNode,
                    context: context,
                    controller: controller.secondPartyIdProofController,
                    onChanged: (value) {
                      controller.secondPartyidProofNumber.value =
                          value.toString();
                      controller.secondPartyvalidateidProofNumberField();
                    },
                    hintText: 'ID Proof*',
                    labelText: 'ID Proof Number *',
                    textCapitalization: TextCapitalization.characters,
                    errorMessage: controller
                            .secondPartyidProofNumberError.value.isNotEmpty
                        ? controller.secondPartyidProofNumberError.value
                        : null,
                  ),
                ),
              ]),
              RmiWidgetHelper.verticalSpacer(10),
              RmiWidgetHelper.appTextField(
                context: context,
                controller: controller.secondPartyMobileNumberController,
                focusNode: controller.secondPartymobileNumberFocusNode,
                errorMessage:
                    controller.secondPartymobileNumberError.value.isNotEmpty
                        ? controller.secondPartymobileNumberError.value
                        : null,
                keyboardType: TextInputType.phone,
                labelText: AppStrings.mobNumber,
                onChanged: (value) {
                  controller.secondPartymobileNumber.value = value;
                  controller.secondPartyvalidatemobileNumberField();
                },
              ),
              RmiWidgetHelper.verticalSpacer(10),
              RmiWidgetHelper.appTextField(
                context: context,
                controller: controller.secondPartyPinCodeController,
                focusNode: controller.secondPartypinCodeFocusNode,
                keyboardType: TextInputType.number,
                errorMessage:
                    controller.secondPartypinCodeError.value.isNotEmpty
                        ? controller.secondPartypinCodeError.value
                        : null,
                labelText: AppStrings.pinCode,
                onChanged: (value) {
                  controller.secondPartypinCode.value = value;
                  controller.secondPartyvalidatepinCodeField();
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
                  isEnabled: controller.secondPartyisDetailsReadyToSubmit(),
                  onPressed: () {
                    controller.secondPartyhandleFormSubmission();
                    controller.secondPartyformVisible.value = false;
                  },
                ),
              ),
            ] else ...[
              Visibility(
                visible: !controller.secondPartyformVisible.value,
                child: RmiWidgetHelper.rmiRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    childrens: [
                      const Icon(
                        Icons.check_circle,
                        color: ColorConstants.checkMark,
                      ),
                      RmiWidgetHelper.rmiText(
                        text: AppStrings.secondPartyDetails,
                        color: ColorConstants.fontGrey,
                      ),
                      RmiWidgetHelper.horizontalSpacer(30.0),
                      RmiWidgetHelper.rmiIconButton(
                        icon: SvgPicture.asset(
                          AssetsConstants.delete,
                        ),
                        onPressed:
                            controller.secondPartydeleteAllDetailsAndOpenForm,
                      ),
                      RmiWidgetHelper.rmiIconButton(
                        icon: SvgPicture.asset(AssetsConstants.edit),
                        onPressed: () {
                          controller.secondPartyformVisible.value = true;
                          controller.secondPartyIsEditing.value = true;
                          controller.secondPartyeditDetails();
                        },
                      ),
                    ]),
              )
            ],
          ],
        ),
      );
    });
  }
}
