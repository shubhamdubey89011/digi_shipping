import 'package:document_fill_demo/party_details/model/party_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPartyDetailsController extends GetxController {
  final FirstPartyDetailsModel model = FirstPartyDetailsModel();

  final nameController = TextEditingController();
  final idProofController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final pinCodeController = TextEditingController();

  final nameFocusNode = FocusNode();
  final idProofFocusNode = FocusNode();
  final mobileNumberFocusNode = FocusNode();
  final pinCodeFocusNode = FocusNode();
  RxBool isEditing = false.obs;


  RxBool isFormValid = false.obs; // Track if the form is valid

  @override
  void onClose() {
    nameController.dispose();
    idProofController.dispose();
    mobileNumberController.dispose();
    pinCodeController.dispose();
    nameFocusNode.dispose();
    idProofFocusNode.dispose();
    mobileNumberFocusNode.dispose();
    pinCodeFocusNode.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();

    // Add listeners to text controllers
    nameController.addListener(validateFields);
    idProofController.addListener(validateFields);
    mobileNumberController.addListener(validateFields);
    pinCodeController.addListener(validateFields);
  }

  void validateFields() {
    model.nameError.value = model.name.value.isEmpty
        ? 'Name is required'
        : (model.name.value.length < 2 ? 'Name must be at least 2 characters long' : '');

    model.idProofNumberError.value = model.idProofNumber.value.isEmpty
        ? 'ID Proof Number is required'
        : (model.idProofNumber.value.length < 6 ? 'ID Proof Number must be at least 6 characters long' : '');

    model.mobileNumberError.value = model.mobileNumber.value.isEmpty
        ? 'Mobile Number is required'
        : (!RegExp(r'^[0-9]{10}$').hasMatch(model.mobileNumber.value)
            ? 'Enter a valid 10-digit mobile number'
            : '');

    model.pinCodeError.value = model.pinCode.value.isEmpty
        ? 'Pin Code is required'
        : (!RegExp(r'^[0-9]{6}$').hasMatch(model.pinCode.value)
            ? 'Enter a valid 6-digit pin code'
            : '');

    // Update form validity
    isFormValid.value = model.nameError.value.isEmpty &&
        model.idProofNumberError.value.isEmpty &&
        model.mobileNumberError.value.isEmpty &&
        model.pinCodeError.value.isEmpty;
  }

  bool isFormValidNow() {
    validateFields();
    return isFormValid.value;
  }

  void resetFields() {
    model.name.value = '';
    model.idProofNumber.value = '';
    model.mobileNumber.value = '';
    model.pinCode.value = '';
    model.nameError.value = '';
    model.idProofNumberError.value = '';
    model.mobileNumberError.value = '';
    model.pinCodeError.value = '';
  }
}



// class FirstPartyDetailsController extends GetxController {
//   var isEditingFirstForm = true.obs; // Track the visibility of the first form
//   var isEditingSecondForm = false.obs; // Track the visibility of the second form
//   var isFirstFormValid = false.obs; // Enable/Disable First Form Continue Button
//   var isSecondFormValid = false.obs; // Enable/Disable Second Form Continue Button

//   // First Form Fields (Non-nullable)
//   var firstFormFields = <String, String>{
//     'name': '',
//     'address': '',
//     'idProof': ''
//   }.obs;

//   // Second Form Fields (Non-nullable)
//   var secondFormFields = <String, String>{
//     'name': '',
//     'address': '',
//     'idProof': ''
//   }.obs;

//   void validateFirstForm() {
//     // Check if all fields in the first form are not empty
//     isFirstFormValid.value = firstFormFields.values.every((field) => field.isNotEmpty);
//   }

//   void validateSecondForm() {
//     // Check if all fields in the second form are not empty
//     isSecondFormValid.value = secondFormFields.values.every((field) => field.isNotEmpty);
//   }

//   void resetFields(bool isFirstForm) {
//     if (isFirstForm) {
//       // Reset first form fields
//       firstFormFields.updateAll((key, value) => '');
//       validateFirstForm();
//     } else {
//       // Reset second form fields
//       secondFormFields.updateAll((key, value) => '');
//       validateSecondForm();
//     }
//   }
// }