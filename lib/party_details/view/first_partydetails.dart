import 'package:document_fill_demo/party_details/controller/party_details_controller.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/utils/custom_textfield1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FirstPartyDetailsCard extends StatefulWidget {
  final FirstPartyDetailsController controller =
      Get.put(FirstPartyDetailsController());
  final List<String> proofs;
  final VoidCallback onContinue;

  FirstPartyDetailsCard({
    super.key,
    required this.proofs,
    required this.onContinue,
  });

  @override
  _FirstPartyDetailsCardState createState() => _FirstPartyDetailsCardState();
}

class _FirstPartyDetailsCardState extends State<FirstPartyDetailsCard> {
  bool formVisible = true; // Toggle form visibility
  bool detailsSubmitted = false; // Flag to show submitted details

  void toggleFormVisibility() {
    setState(() {
      formVisible = !formVisible;
      detailsSubmitted = !formVisible; // Set flag to true when form is hidden
    });
  }

  void editDetails() {
    setState(() {
      formVisible = true;
      detailsSubmitted = false;
    });
  }

  void deleteDetails() {
    setState(() {
      formVisible = true;
      detailsSubmitted = false;
      widget.controller.resetFields(); // Reset the form fields
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(141, 188, 211, 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: 'Add First Party Details',
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(78, 77, 77, 1),
              fontSize: 14,
            ),
            const SizedBox(height: 10),
            // Form visibility toggle
            if (formVisible) ...[
              // Form section
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 42,
                      width: 293,
                      child: appTextField(
                        controller: widget.controller.nameController,
                        labelText: 'Name *',
                        context: context,
                        cursorHeight: 12,
                        enabled: true,
                        focusNode: widget.controller.nameFocusNode,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          widget.controller.model.name.value = value;
                          widget.controller.isFormValidNow();
                        },
                      ),
                    ),
                    if (widget.controller.model.nameError.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: customText(
                          text: widget.controller.model.nameError.value,
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                  ],
                );
              }),
              const SizedBox(height: 8),
              Column(
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
                              focusColor: Colors.transparent,
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: widget.controller.model.selectedProof.value
                                      .isEmpty
                                  ? widget.proofs[0]
                                  : widget.controller.model.selectedProof.value,
                              items: widget.proofs.map((proof) {
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
                                  widget.controller.model.selectedProof.value =
                                      value;
                                  widget.controller.isFormValidNow();
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
                            controller: widget.controller.idProofController,
                            focusNode: widget.controller.idProofFocusNode,
                            cursorHeight: 12,
                            enabled: true,
                            keyboardType: TextInputType.number,
                            labelText: 'ID Proof Number *',
                            onChanged: (value) {
                              widget.controller.model.idProofNumber.value =
                                  value;
                              widget.controller.isFormValidNow();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(() {
                    return widget.controller.model.idProofNumberError.value
                            .isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: customText(
                              text: widget
                                  .controller.model.idProofNumberError.value,
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          )
                        : SizedBox.shrink();
                  }),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42,
                      child: appTextField(
                        context: context,
                        controller: widget.controller.mobileNumberController,
                        focusNode: widget.controller.mobileNumberFocusNode,
                        cursorHeight: 12,
                        enabled: true,
                        keyboardType: TextInputType.phone,
                        labelText: 'Mobile Number *',
                        onChanged: (value) {
                          widget.controller.model.mobileNumber.value = value;
                          widget.controller.isFormValidNow();
                        },
                      ),
                    ),
                    if (widget
                        .controller.model.mobileNumberError.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: customText(
                          text: widget.controller.model.mobileNumberError.value,
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                  ],
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42,
                      child: appTextField(
                        context: context,
                        controller: widget.controller.pinCodeController,
                        focusNode: widget.controller.pinCodeFocusNode,
                        cursorHeight: 12,
                        enabled: true,
                        keyboardType: TextInputType.number,
                        labelText: 'Pin Code *',
                        onChanged: (value) {
                          widget.controller.model.pinCode.value = value;
                          widget.controller.isFormValidNow();
                        },
                      ),
                    ),
                    if (widget.controller.model.pinCodeError.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: customText(
                          text: widget.controller.model.pinCodeError.value,
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                  ],
                );
              }),
              const Spacer(),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: widget.controller.isFormValid.value
                        ? () {
                            widget.controller.model.saveDetails();
                            Get.showSnackbar(GetSnackBar(
                              message: 'Details saved locally in SQLite!',
                              duration: Duration(seconds: 2),
                            ));

                            // Toggle visibility to show submitted details
                            toggleFormVisibility();
                          }
                        : null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        widget.controller.isFormValid.value
                            ? const Color.fromRGBO(55, 0, 179, 1)
                            : Colors.grey,
                      ),
                    ),
                    child: customText(
                      text: 'Continue',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ] else ...[
              Row(
                children: [
                  SvgPicture.asset(
                      'assets/icons/tick_mark.svg',
                     
                      height: 16, 
                      width: 16,
                    ),
                  const SizedBox(width: 5),
                  customText(
                    text: 'First Party Details',
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(78, 77, 77, 1),
                    fontSize: 14,
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/delete.svg',
                      color: Colors.black,
                      height: 18, 
                      width: 16,
                    ),
                    onPressed: deleteDetails,
                    tooltip: 'Delete',
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/edit_icon.svg',
                      color: Colors.black,
                      height: 16, 
                      width: 15,
                    ),
                    onPressed: editDetails,
                    tooltip: 'Edit',
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
