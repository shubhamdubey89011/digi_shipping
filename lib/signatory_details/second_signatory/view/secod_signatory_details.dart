import 'package:document_fill_demo/common_controller/toggle_controller.dart';
import 'package:document_fill_demo/constants/assets_constants.dart';
import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/constants/dimensions.dart';
import 'package:document_fill_demo/signatory_details/second_signatory/controller/second_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/first_signatory_details/controller/first_signatory_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: secondController.instances.length > 7
                  ? 7
                  : secondController.instances.length,
              itemBuilder: (context, index) {
                final instance = secondController.instances[index];
                return Obx(() {
                  return RmiWidgetHelper.rmiAnimatedContainer(
                    // margin: EdgeInsets.all(5),
                    child: RmiWidgetHelper.rmiColumn(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      childrens: [
                        Visibility(
                          visible: instance.formVisible.value,
                          child: RmiWidgetHelper.rmiText(
                            text: AppStrings.signatoryDetails,
                            color: ColorConstants.fontGrey,
                          ),
                        ),
                        if (instance.formVisible.value) ...[
                          RmiWidgetHelper.verticalSpacer(10),
                          RmiWidgetHelper.appTextField(
                            controller: instance.nameController,
                            labelText: 'Name *',
                            context: context,
                            cursorHeight: 12,
                            enabled: true,
                            errorMessage: instance.nameError.value.isNotEmpty
                                ? instance.nameError.value
                                : null,
                            focusNode: instance.nameFocusNode,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              instance.name.value = value;
                              instance.validateNameField();
                            },
                          ),
                          RmiWidgetHelper.verticalSpacer(8),
                          RmiWidgetHelper.rmiRow(childrens: [
                            Expanded(
                              flex: 2,
                              child: RmiWidgetHelper.rmiDropDown1(
                                value: instance.selectedProof.value.toString(),
                                onDropDownChanged: (value) {
                                  print(value);

                                  if (value != null) {
                                    instance.selectedProof.value = value;
                                    instance.validateidProofNumberField();
                                  }
                                  debugPrint(
                                      "Error: ${instance.idProofNumberError.value}");
                                },
                                items: proofs,
                                error: instance
                                    .idProofNumberError.value.isNotEmpty,
                                errorMessage: instance.idProofNumberError.value,
                              ),
                            ),
                            RmiWidgetHelper.horizontalSpacer(10),
                            Expanded(
                              flex: 3,
                              child: RmiWidgetHelper.appTextField(
                                focusNode: instance.idProofFocusNode,
                                context: context,
                                controller: instance.idProofController,
                                onChanged: (value) {
                                  instance.idProofNumber.value =
                                      value.toString();
                                  instance.validateidProofNumberField();
                                },
                                hintText: 'ID Proof*',
                                labelText: 'ID Proof Number *',
                                textCapitalization:
                                    TextCapitalization.characters,
                                errorMessage:
                                    instance.idProofNumberError.value.isNotEmpty
                                        ? instance.idProofNumberError.value
                                        : null,
                              ),
                            ),
                          ]),
                          RmiWidgetHelper.verticalSpacer(10),
                          RmiWidgetHelper.appTextField(
                            context: context,
                            controller: instance.emailController,
                            focusNode: instance.emailFocusNode,
                            cursorHeight: 12,
                            enabled: true,
                            errorMessage: instance.emailError.value.isNotEmpty
                                ? instance.emailError.value
                                : null,
                            keyboardType: TextInputType.emailAddress,
                            labelText: 'Email *',
                            onChanged: (value) {
                              instance.email.value = value;
                              instance.validateEmail();
                            },
                          ),
                          const SizedBox(height: 10),
                          RmiWidgetHelper.appTextField(
                            context: context,
                            controller: instance.mobileNumberController,
                            focusNode: instance.mobileNumberFocusNode,
                            cursorHeight: 12,
                            enabled: true,
                            errorMessage:
                                instance.mobileNumberError.value.isNotEmpty
                                    ? instance.mobileNumberError.value
                                    : null,
                            keyboardType: TextInputType.phone,
                            labelText: 'Mobile Number *',
                            onChanged: (value) {
                              instance.mobileNumber.value = value;
                              instance.validatemobileNumberField();
                            },
                          ),
                          const SizedBox(height: 10),
                          RmiWidgetHelper.appTextField(
                            context: context,
                            controller: instance.relationshipController,
                            focusNode: instance.relationshipFocusNode,
                            cursorHeight: 12,
                            enabled: true,
                            keyboardType: TextInputType.text,
                            errorMessage:
                                instance.relationshipError.value.isNotEmpty
                                    ? instance.relationshipError.value
                                    : null,
                            labelText: 'Relationship of the Party *',
                            onChanged: (value) {
                              instance.relationship.value = value;
                              instance.validateRelationship();
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
                                      color: ColorConstants.toggleBorder,
                                      width: 1),
                                ),
                                child: RmiWidgetHelper.rmiIconButton(
                                  onPressed: () async {
                                    await instance.pickDate(context);
                                  },
                                  icon: Icon(Icons.calendar_month),
                                ),
                              ),
                              RmiWidgetHelper.horizontalSpacer(20),
                              instance.selectedDate.value == null
                                  ? RmiWidgetHelper.rmiColumn(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      childrens: [
                                        RmiWidgetHelper.rmiText(
                                          text:
                                              'Date of Birth of the signatory or ',
                                          color: ColorConstants.fontDarkGrey,
                                        ),
                                        RmiWidgetHelper.rmiText(
                                          text: 'date of incorporation of the ',
                                          color: ColorConstants.fontDarkGrey,
                                        ),
                                        RmiWidgetHelper.rmiText(
                                          text:
                                              'company in case of non-individual ',
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
                                            "${instance.selectedDate.value!.day}/${instance.selectedDate.value!.month}/${instance.selectedDate.value!.year}",
                                        color: ColorConstants.fontDarkGrey,
                                      ),
                                    )
                            ],
                          ),
                          const SizedBox(height: 15),
                          RmiWidgetHelper.rmiDropDown1(
                            value: instance.selectedParty.value.toString(),
                            hint: RmiWidgetHelper.rmiText(text: 'Party Type*'),
                            onDropDownChanged: (value) {
                              print("Party type  $value");

                              if (value != null) {
                                instance.selectedParty.value = value;
                              }
                            },
                            items: party,
                            error: instance.partyError.value.isNotEmpty,
                            errorMessage: instance.partyError.value,
                          ),
                          const SizedBox(height: 15),
                          RmiWidgetHelper.buildToggleSection(
                            context: context,
                            controller: genderController,
                            labels: ['Male', 'Female'],
                            onValueChanged: (index) {
                              instance.maleorfemale.value = index;
                              instance.gender.value = index == 0
                                  ? 'Male'
                                  : 'Female';
                            },
                          ),
                          RmiWidgetHelper.verticalSpacer(20),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: Obx(() {
                              return RmiWidgetHelper.customElevatedButton(
                                color: ColorConstants.buttonColor,
                                context: context,
                                text: AppStrings.continueButton,
                                textColor: ColorConstants.backgroundWhite,
                                isEnabled: instance.isDetailsReadyToSubmit(),
                                onPressed: () {
                                  instance.handleFormSubmission();
                                  instance.verifySavedDataBoth();
                                  instance.formVisible.value = false;
                                },
                              );
                            }),
                          ),
                        ] else ...[
                          Obx(() {
                            return Visibility(
                              visible: !instance.formVisible.value,
                              child: RmiWidgetHelper.rmiRow(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  childrens: [
                                    const Icon(
                                      Icons.check_circle,
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
                                        instance
                                            .deleteInstanceById(instance.id);
                                        instance.clearDate();
                                        instance.formVisible.value = true;
                                      },
                                    ),
                                    RmiWidgetHelper.rmiIconButton(
                                      icon: SvgPicture.asset(
                                          AssetsConstants.edit),
                                      onPressed: () {
                                        instance.formVisible.value = true;
                                        instance.isEditing.value = true;
                                        instance.editDetails();
                                      },
                                    ),
                                  ]),
                            );
                          }),
                        ],
                      ],
                    ),
                  );
                });
              }),
          RmiWidgetHelper.verticalSpacer(10),
          RmiWidgetHelper.customElevatedButton(
            isEnabled: true,
            text: "Add Signatory Details",
            context: context,
            onPressed: () {
              secondController.addInstance();
              // secondController.formVisible.toggle();
            },
          ),
        ],
      );
    });
  }
}
