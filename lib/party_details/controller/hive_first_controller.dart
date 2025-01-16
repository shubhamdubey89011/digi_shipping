// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:document_fill_demo/party_details/model/party_model.dart';

// class PartyController extends GetxController {
//   final nameController = TextEditingController();
//   final idProofController = TextEditingController();
//   final mobileNumberController = TextEditingController();
//   final pinCodeController = TextEditingController();
//   final selectedProofController = TextEditingController();

//   final nameFocusNode = FocusNode();
//   final idProofFocusNode = FocusNode();
//   final mobileNumberFocusNode = FocusNode();
//   final pinCodeFocusNode = FocusNode();

//   dynamic isEditing = false.obs;

//   RxString nameError = ''.obs;
//   RxString idProofNumberError = ''.obs;
//   RxString mobileNumberError = ''.obs;
//   RxString pinCodeError = ''.obs;

//   var isFormValid = false.obs;
//   var formVisible = true.obs;
//   var detailsSubmitted = false.obs;

//   RxList<PartyModel> partyList = <PartyModel>[].obs;

//   RxString name = ''.obs;
//   RxString idProofNumber = ''.obs;
//   RxString mobileNumber = ''.obs;
//   RxString pinCode = ''.obs;
//   RxString selectedProof = ''.obs;

//   var isPartyFormSubmitted = false.obs;

//   late Box<PartyModel> _partyModelBox;

//   Future<void> initializeHiveBox() async {
//     if (!Hive.isBoxOpen('partyModelBox')) {
//       _partyModelBox = await Hive.openBox<PartyModel>('partyModelBox');
//     } else {
//       _partyModelBox = Hive.box<PartyModel>('partyModelBox');
//     }
//   }

//   @override
//   void onInit() async {
//     super.onInit();
//     await loadDetails();
//     nameController.addListener(validateNameField);
//     idProofController.addListener(validateidProofNumberField);
//     mobileNumberController.addListener(validatemobileNumberField);
//     pinCodeController.addListener(validatepinCodeField);
//   }

//   Future<void> loadDetails() async {
//     try {
//       await initializeHiveBox();

//       if (_partyModelBox.isNotEmpty) {
//         final party = _partyModelBox.getAt(_partyModelBox.length - 1);

//         if (party != null) {
//           name.value = party.name;
//           idProofNumber.value = party.idProofNumber?.toString() ?? '';
//           mobileNumber.value = party.mobileNumber.toString();
//           pinCode.value = party.pinCode?.toString() ?? '';
//           selectedProof.value = party.selectedProof ?? '';

//           // Update the text controllers with the loaded values
//           nameController.text = name.value;
//           idProofController.text = idProofNumber.value;
//           mobileNumberController.text = mobileNumber.value;
//           pinCodeController.text = pinCode.value;
//           selectedProofController.text = selectedProof.value;

//           print(
//               'Loaded data: $name, $idProofNumber, $mobileNumber, $pinCode, $selectedProof');
//         } else {
//           print("No party data found.");
//         }
//       } else {
//         print("Box is empty.");
//       }
//     } catch (e) {
//       print("Error loading details: $e");
//     }
//   }

// // Handle form submission and save details in Hive
//   void handleFormSubmission() async {
//     if (isDetailsReadyToSubmit()) {
//       await saveDetails();
//       await loadDetails(); // Load the saved details into the fields without resetting them
//       // No need to call resetFields here, since we want to keep the data for editing later
//       isPartyFormSubmitted.value = true;
//       Get.showSnackbar(GetSnackBar(
//         message: 'Details saved locally in Hive!',
//         duration: const Duration(seconds: 2),
//       ));
//       toggleFormVisibility();
//     }
//   }

// // Save details to Hive
//   Future<void> saveDetails() async {
//     try {
//       final newPartyDetails = PartyModel(
//         name: name.value,
//         idProofNumber: int.tryParse(idProofNumber.value),
//         mobileNumber: int.tryParse(mobileNumber.value)!,
//         pinCode: int.tryParse(pinCode.value),
//         selectedProof: selectedProof.value,
//       );

//       await initializeHiveBox(); // Ensure box is opened before saving
//       await _partyModelBox
//           .add(newPartyDetails); // Add new party details to Hive

//       partyList.add(newPartyDetails); // Add to the list for UI
//       print('saved data: $name, $mobileNumber, $pinCode');
//       print("Details saved successfully.");
//     } catch (e) {
//       print("Error saving details: $e");
//     }
//   }

// // Edit party details from Hive
//   void editDetails() {
//     loadDetails().then((_) {
//       if (partyList.isNotEmpty) {
//         var lastParty = partyList.last; // Get the last party details
//         nameController.text = lastParty.name;
//         idProofController.text = lastParty.idProofNumber?.toString() ?? '';
//         mobileNumberController.text = lastParty.mobileNumber.toString();
//         pinCodeController.text = lastParty.pinCode?.toString() ?? '';
//         selectedProofController.text = lastParty.selectedProof ?? '';
//         toggleFormVisibility();
//       }
//     });
//   }

//   // Validation methods
//   void validateNameField() {
//     nameError.value = name.value.isEmpty
//         ? 'Name is required'
//         : name.value.length < 2
//             ? 'Name must be at least 2 characters long'
//             : '';
//   }

//   void validateidProofNumberField() {
//     idProofNumberError.value = idProofNumber.value.isEmpty
//         ? 'ID Proof Number is required'
//         : idProofNumber.value.length < 6
//             ? 'ID Proof Number must be at least 6 characters long'
//             : '';
//   }

//   void validatemobileNumberField() {
//     mobileNumberError.value = mobileNumber.value.isEmpty
//         ? 'Mobile Number is required'
//         : !RegExp(r'^[0-9]{10}$').hasMatch(mobileNumber.value)
//             ? 'Enter a valid 10-digit mobile number'
//             : '';
//   }

//   void validatepinCodeField() {
//     pinCodeError.value = pinCode.value.isEmpty
//         ? 'Pin Code is required'
//         : !RegExp(r'^[0-9]{6}$').hasMatch(pinCode.value)
//             ? 'Enter a valid 6-digit pin code'
//             : '';
//   }

//   // Reset form fields
//   void resetFields() {
//     name.value = '';
//     idProofNumber.value = '';
//     mobileNumber.value = '';
//     pinCode.value = '';
//     selectedProof.value = '';

//     nameController.clear();
//     idProofController.clear();
//     mobileNumberController.clear();
//     pinCodeController.clear();
//     selectedProofController.clear();

//     nameError.value = '';
//     idProofNumberError.value = '';
//     mobileNumberError.value = '';
//     pinCodeError.value = '';
//   }

//   // Delete all details from Hive
//   Future<void> deleteAllDetails() async {
//     try {
//       var box = await Hive.openBox<PartyModel>('partyBox');
//       await box.clear();
//       partyList.clear();
//       print("All details deleted successfully.");
//     } catch (e) {
//       print("Error deleting details: $e");
//     }
//   }

//   // Delete specific party detail
//   Future<void> delete(PartyModel partyModel) async {
//     try {
//       var box = await Hive.openBox<PartyModel>('partyBox');
//       await partyModel.delete();
//       partyList.remove(partyModel);
//     } catch (e) {
//       print("Error deleting party: $e");
//     }
//   }

//   // Inside PartyController class

//   void deleteAllDetailsAndOpenForm() async {
//     await deleteAllDetails();
//     checkTableAndToggleForm();
//   }

//   Future<void> checkTableAndToggleForm() async {
//     final hasData = await hasDataInTable();
//     formVisible.value = !hasData;
//     detailsSubmitted.value = !hasData; // Hide the form if data exists
//   }

//   Future<bool> hasDataInTable() async {
//     final box = await Hive.openBox<PartyModel>('partyModelBox');
//     return box.isNotEmpty;
//   }

//   Future<Map<String, dynamic>?> fetchLastPartyDetail(
//       {required String boxName}) async {
//     try {
//       await initializeHiveBox(); // Ensure the box is opened

//       if (_partyModelBox.isEmpty) {
//         return null;
//       }

//       // Get the last entry (by index)
//       var lastEntry = _partyModelBox.getAt(_partyModelBox.length + 1);

//       if (lastEntry != null) {
//         // Convert the PartyModel object to a Map and return it
//         return {
//           'name': lastEntry.name,
//           'idProofNumber': lastEntry.idProofNumber,
//           'mobileNumber': lastEntry.mobileNumber,
//           'pinCode': lastEntry.pinCode,
//           'selectedProof': lastEntry.selectedProof,
//         };
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print("Error fetching last party detail: $e");
//       return null;
//     }
//   }

//   // Toggle form visibility
//   void toggleFormVisibility() {
//     formVisible.value = !formVisible.value;
//     detailsSubmitted.value = !formVisible.value;
//   }

//   bool isDetailsReadyToSubmit() {
//     return nameError.value.isEmpty &&
//         idProofNumberError.value.isEmpty &&
//         mobileNumberError.value.isEmpty &&
//         pinCodeError.value.isEmpty;
//   }
// }
