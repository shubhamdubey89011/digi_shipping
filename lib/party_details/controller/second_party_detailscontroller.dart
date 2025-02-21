// import 'dart:async';

// import 'package:document_fill_demo/party_details/model/party_details_model.dart';
// import 'package:document_fill_demo/db_helper/db_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SecondPartyDetailscontroller extends GetxController {
//   final secondPartyNameController = TextEditingController();
//   final secondPartyIdProofController = TextEditingController();
//   final secondPartyMobileNumberController = TextEditingController();
//   final secondPartyPinCodeController = TextEditingController();
//   final secondPartySelectedProofController = TextEditingController();

//   final secondPartynameFocusNode = FocusNode();
//   final secondPartyidProofFocusNode = FocusNode();
//   final secondPartymobileNumberFocusNode = FocusNode();
//   final secondPartypinCodeFocusNode = FocusNode();
//   dynamic isEditing = false.obs;

//   RxString secondPartynameError = ''.obs;
//   RxString secondPartyidProofNumberError = ''.obs;
//   RxString secondPartymobileNumberError = ''.obs;
//   RxString secondPartypinCodeError = ''.obs;

//   var secondPartyisFormValid = false.obs;
//   var secondPartyformVisible = true.obs;
//   var secondPartydetailsSubmitted = false.obs;
//   var secondPartysecondFormVisible = true.obs;

//   RxList<PartyDetails> partyDetailsList = <PartyDetails>[].obs;

//   RxString secondPartyname = ''.obs;
//   RxString secondPartyidProofNumber = ''.obs;
//   RxString secondPartymobileNumber = ''.obs;
//   RxString secondPartypinCode = ''.obs;
//   RxString secondPartyselectedProof = ''.obs;

//   final DatabaseHelper _dbHelper = DatabaseHelper();

//   RxBool secondPartyisDataStored = false.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     secondPartycheckTableAndToggleForm();

//     secondPartyNameController.addListener(secondPartyvalidateNameField);
//     secondPartyIdProofController
//         .addListener(secondPartyvalidateidProofNumberField);
//     secondPartyMobileNumberController
//         .addListener(secondPartyvalidatemobileNumberField);
//     secondPartyPinCodeController.addListener(secondPartyvalidatepinCodeField);
//   }

//   void secondPartytoggleFormVisibility() {
//     secondPartyformVisible.value = !secondPartyformVisible.value;
//     secondPartydetailsSubmitted.value = !secondPartyformVisible.value;
//   }

//   Future<void> secondPartycheckTableAndToggleForm() async {
//     final hasDataInDB = await secondPartyhasDataInTable();
//     print("hasdata secondParty =  $hasDataInDB");
//     secondPartyformVisible.value = !hasDataInDB;
//     secondPartydetailsSubmitted.value = !hasDataInDB;
//   }

//   Future<bool> secondPartyhasDataInTable() async {
//     final data =
//         await _dbHelper.fetchAllPartyDetails1(tableName: 'secondpartydetails');
//     print("Fetched data from second table : $data");
//     return data.isNotEmpty;
//   }

//   void secondPartyhandleFormSubmission() {
//     if (secondPartyisDetailsReadyToSubmit()) {
//       secondPartysaveDetails1();
//       secondPartyresetFields();

//       Get.showSnackbar(GetSnackBar(
//         message: 'Details saved locally in SQLite!',
//         duration: const Duration(seconds: 2),
//       ));
//       secondPartytoggleFormVisibility();
//     }
//   }

//   bool secondPartyisDetailsReadyToSubmit() {
//     return secondPartyname.value.isNotEmpty &&
//         secondPartyidProofNumber.value.isNotEmpty &&
//         secondPartymobileNumber.value.isNotEmpty &&
//         secondPartypinCode.value.isNotEmpty &&
//         secondPartynameError.value.isEmpty &&
//         secondPartyidProofNumberError.value.isEmpty &&
//         secondPartymobileNumberError.value.isEmpty &&
//         secondPartypinCodeError.value.isEmpty;
//   }

//   void secondPartydeleteAllDetailsAndOpenForm() async {
//     await secondPartydeleteAllDetails();
//     secondPartycheckTableAndToggleForm();
//     secondPartyisDataStored.value = false;
//   }

//   Future<void> secondPartysaveDetails1() async {
//     try {
//       final newPartyDetails = PartyDetails(
//         name: secondPartyname.value,
//         idProofNumber: secondPartyidProofNumber.value,
//         mobileNumber: int.parse(secondPartymobileNumber.value),
//         pinCode: int.parse(secondPartypinCode.value),
//         selectedProof: secondPartyselectedProof.value,
//       );

//       await _dbHelper.insertDatToSqLite1(
//         data: newPartyDetails.toMap(),
//         tableName: 'secondpartydetails',
//       );

//       partyDetailsList.add(newPartyDetails);

//       print("Details saved successfully.");
//     } catch (e) {
//       print("Error saving details: $e");
//     }
//   }

//   void secondPartyeditDetails() {
//     secondPartyloadDetails().then((_) {
//       secondPartyNameController.text = secondPartyname.value.toString();
//       secondPartyIdProofController.text =
//           secondPartyidProofNumber.value.toString();
//       secondPartyMobileNumberController.text =
//           secondPartymobileNumber.value.toString();
//       secondPartyPinCodeController.text = secondPartypinCode.value.toString();
//       secondPartySelectedProofController.text =
//           secondPartyselectedProof.value.toString();

//       // toggleFormVisibility();
//       secondPartyformVisible.value = true;
//     });
//   }

//   Future<void> secondPartydeleteAllDetails() async {
//     try {
//       int rowsDeleted = await _dbHelper.deleteAllDataFromTable1(
//           tableName: 'secondpartydetails');

//       if (rowsDeleted > 0) {
//         print("All details deleted successfully.");
//         partyDetailsList.clear();
//       } else {
//         print("No details found to delete.");
//       }
//     } catch (e) {
//       print("Error deleting details: $e");
//     }
//   }

//   Future<void> secondPartyloadDetails() async {
//     try {
//       final data = await _dbHelper.fetchLastPartyDetail1(
//           tableName: 'secondpartydetails');

//       if (data != null) {
//         secondPartyname.value = data['name']?.toString() ?? '';
//         secondPartyidProofNumber.value =
//             data['idProofNumber']?.toString() ?? '';
//         secondPartymobileNumber.value = data['mobileNumber']?.toString() ?? '';
//         secondPartypinCode.value = data['pinCode']?.toString() ?? '';
//         secondPartyselectedProof.value =
//             data['selectedProof']?.toString() ?? '';

//         partyDetailsList.add(PartyDetails.fromMap(data));

//         print(
//             'Fetched data for second form: $secondPartyname, $secondPartyidProofNumber, $secondPartymobileNumber, $secondPartypinCode, $secondPartyselectedProof');
//       } else {
//         print("No data found.");
//       }

//       print("Details loaded successfully.");
//     } catch (e) {
//       print("Error loading details: $e");
//     }
//   }

//   void secondPartyvalidateNameField() {
//     secondPartynameError.value = secondPartyname.value.isEmpty
//         ? 'Name is required'
//         : !RegExp(r'^[A-Za-z ]{3,25}$').hasMatch(secondPartyname.value)
//             ? 'Invalid Name'
//             : '';
//   }

//   void secondPartyvalidateidProofNumberField() {
//     if (secondPartyselectedProof.value.isEmpty) {
//       secondPartyidProofNumberError.value = 'Please select an ID Proof';
//       return;
//     }

//     switch (secondPartyselectedProof.value) {
//       case 'Aadhaar Card':
//         secondPartyidProofNumberError.value =
//             secondPartyidProofNumber.value.isEmpty
//                 ? 'Aadhaar Number is required'
//                 : !RegExp(r'^\d{12}$').hasMatch(secondPartyidProofNumber.value)
//                     ? 'Invalid Aadhaar Card Number'
//                     : '';
//         break;

//       case 'Voter ID Card':
//         secondPartyidProofNumberError.value =
//             secondPartyidProofNumber.value.isEmpty
//                 ? 'Voter ID is required'
//                 : !RegExp(r'^[A-Z,a-z]{3}[0-9]{7}$')
//                         .hasMatch(secondPartyidProofNumber.value)
//                     ? 'Invalid VOTER ID'
//                     : '';
//         break;

//       case 'PAN Card':
//         secondPartyidProofNumberError.value =
//             secondPartyidProofNumber.value.isEmpty
//                 ? 'PAN Card number is required'
//                 : !RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$')
//                         .hasMatch(secondPartyidProofNumber.value)
//                     ? 'Invalid PAN Card Number'
//                     : '';
//         break;

//       case 'Passport':
//         secondPartyidProofNumberError.value =
//             secondPartyidProofNumber.value.isEmpty
//                 ? 'Passport Number is required'
//                 : !RegExp(r'^[A-Z][0-9]{7}$')
//                         .hasMatch(secondPartyidProofNumber.value)
//                     ? 'Invalid Passport'
//                     : '';
//         break;

//       default:
//         secondPartyidProofNumberError.value = '';
//     }
//   }

//   void secondPartyvalidatemobileNumberField() {
//     secondPartymobileNumberError.value = secondPartymobileNumber.value.isEmpty
//         ? 'Mobile Number is required'
//         : !RegExp(r'^[6789]\d{9}$').hasMatch(secondPartymobileNumber.value)
//             ? 'Invalid Mobile Number'
//             : '';
//   }

//   void secondPartyvalidatepinCodeField() {
//     secondPartypinCodeError.value = secondPartypinCode.value.isEmpty
//         ? 'Pin Code is required'
//         : !RegExp(r'^[0-9]{6}$').hasMatch(secondPartypinCode.value)
//             ? 'Invalid PinCode'
//             : '';
//   }

//   void secondPartyresetFields() {
//     secondPartyname.value = '';
//     secondPartyidProofNumber.value = '';
//     secondPartymobileNumber.value = '';
//     secondPartypinCode.value = '';
//     secondPartyselectedProof.value = '';

//     secondPartyNameController.clear();
//     secondPartyIdProofController.clear();
//     secondPartyMobileNumberController.clear();
//     secondPartyPinCodeController.clear();
//     secondPartySelectedProofController.clear();

//     secondPartynameError.value = '';
//     secondPartyidProofNumberError.value = '';
//     secondPartymobileNumberError.value = '';
//     secondPartypinCodeError.value = '';
//   }

//   bool secondPartyhasFormData() {
//     return secondPartyname.value.isNotEmpty &&
//         secondPartymobileNumber.value.isNotEmpty &&
//         secondPartyselectedProof.value.isNotEmpty &&
//         secondPartyidProofNumber.value.isNotEmpty &&
//         secondPartypinCode.value.isNotEmpty;
//   }
// }
