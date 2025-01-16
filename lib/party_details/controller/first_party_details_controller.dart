import 'package:document_fill_demo/party_details/db_helper/db_helper_keys.dart';
import 'package:document_fill_demo/party_details/model/party_details_model.dart';
import 'package:document_fill_demo/party_details/db_helper/db_helper.dart';
import 'package:document_fill_demo/party_details/model/party_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPartyDetailsController extends GetxController {
  final nameController = TextEditingController();
  final idProofController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final pinCodeController = TextEditingController();
  final selectedProofController = TextEditingController();

  final nameFocusNode = FocusNode();
  final idProofFocusNode = FocusNode();
  final mobileNumberFocusNode = FocusNode();
  final pinCodeFocusNode = FocusNode();
  dynamic isEditing = false.obs;

  RxString nameError = ''.obs;
  RxString idProofNumberError = ''.obs;
  RxString mobileNumberError = ''.obs;
  RxString pinCodeError = ''.obs;

  var isFormValid = false.obs;
  var formVisible = true.obs;
  var detailsSubmitted = false.obs;

  RxList<PartyDetails> partyDetailsList = <PartyDetails>[].obs;

  RxString name = ''.obs;
  RxString idProofNumber = ''.obs;
  RxString mobileNumber = ''.obs;
  RxString pinCode = ''.obs;
  RxString selectedProof = ''.obs;

  final DatabaseHelper _dbHelper = DatabaseHelper();

  var isFirstPartyFormSubmitted = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await checkTableAndToggleForm();

    nameController.addListener(validateNameField);
    idProofController.addListener(validateidProofNumberField);
    mobileNumberController.addListener(validatemobileNumberField);
    pinCodeController.addListener(validatepinCodeField);
  }

  void toggleFormVisibility() {
    formVisible.value = !formVisible.value;
    detailsSubmitted.value = !formVisible.value;
  }

   void toggleFormVisibility1() {
    formVisible.value = !formVisible.value;
  }

  Future<void> checkTableAndToggleForm() async {
    final hasData = await hasDataInTable();
    print(hasData);
    formVisible.value = !hasData;
    detailsSubmitted.value = !hasData; // Hide the form if data exists
  }

  void handleFormSubmission() {
    if (isDetailsReadyToSubmit()) {
      saveDetails();
      resetFields();
      isFirstPartyFormSubmitted.value = true;
      Get.showSnackbar(GetSnackBar(
        message: 'Details saved locally in SQLite!',
        duration: const Duration(seconds: 2),
      ));
      toggleFormVisibility();
    }
  }
  

  bool isDetailsReadyToSubmit() {
    return nameError.value.isEmpty &&
        idProofNumberError.value.isEmpty &&
        mobileNumberError.value.isEmpty &&
        pinCodeError.value.isEmpty;
  }

  void deleteAllDetailsAndOpenForm() async {
    await deleteAllDetails();
    checkTableAndToggleForm();
  }

  Future<bool> hasDataInTable() async {
    final data =
        await _dbHelper.fetchAllPartyDetails(tableName: DbHelperKeys.firstPartyDetailsColumn);
    print("Fetched data from table: $data");
    return data.isNotEmpty;
  }

  Future<void> saveDetails() async {
    try {
      final newPartyDetails = PartyDetails(
        name: name.value.toString(),
        idProofNumber:  int.parse(mobileNumber.value),
        mobileNumber: int.parse(mobileNumber.value),
        pinCode: int.parse(pinCode.value),
        selectedProof: selectedProof.value.toString(),
      );

      await _dbHelper.insertDatToSqLite(
        data: newPartyDetails.toMap(),
        tableName: 'firstpartydetails',
      );

      partyDetailsList.add(newPartyDetails);

      print("Details saved successfully.");
    } catch (e) {
      print("Error saving details: $e");
    }
  }
  
  void editDetails() {
    loadDetails().then((_) {
  
      nameController.text = name.value.toString();
      idProofController.text = idProofNumber.value.toString();
      mobileNumberController.text = mobileNumber.value.toString();
      pinCodeController.text = pinCode.value.toString();
      selectedProofController.text = selectedProof.value.toString();

      toggleFormVisibility();});

  }

  void validateNameField() {
    nameError.value = name.value.isEmpty
        ? 'Name is required'
        : name.value.length < 2
            ? 'Name must be at least 2 characters long'
            : '';
  }

  void validateidProofNumberField() {
    idProofNumberError.value = idProofNumber.value.isEmpty
        ? 'ID Proof Number is required'
        : idProofNumber.value.length < 6
            ? 'ID Proof Number must be at least 6 characters long'
            : '';
  }

  void validatemobileNumberField() {
    mobileNumberError.value = mobileNumber.value.isEmpty
        ? 'Mobile Number is required'
        : !RegExp(r'^[0-9]{10}$').hasMatch(mobileNumber.value)
            ? 'Enter a valid 10-digit mobile number'
            : '';
  }

  void validatepinCodeField() {
    pinCodeError.value = pinCode.value.isEmpty
        ? 'Pin Code is required'
        : !RegExp(r'^[0-9]{6}$').hasMatch(pinCode.value)
            ? 'Enter a valid 6-digit pin code'
            : '';
  }

  Future<void> deleteAllDetails() async {
    try {
      int rowsDeleted = await _dbHelper.deleteAllDataFromTable(
          tableName: 'firstpartydetails');

      if (rowsDeleted > 0) {
        print("All details deleted successfully.");
        partyDetailsList.clear();
      } else {
        print("No details found to delete.");
      }
    } catch (e) {
      print("Error deleting details: $e");
    }
  }

 Future<void> loadDetails() async {
  try {
    // Modify this method in your DatabaseHelper class to fetch the last inserted record
    final data = await _dbHelper.fetchLastPartyDetail(tableName: 'firstpartydetails');

    if (data != null) {
      name.value = data['name']?.toString() ?? '';
      idProofNumber.value = data['idProofNumber']?.toString() ?? '';
      mobileNumber.value = data['mobileNumber']?.toString() ?? '';
      pinCode.value = data['pinCode']?.toString() ?? '';
      selectedProof.value = data['selectedProof']?.toString() ?? '';

      partyDetailsList.add(PartyDetails.fromMap(data));

      print(
          'Fetched data: $name, $idProofNumber, $mobileNumber, $pinCode, $selectedProof');
    } else {
      print("No data found.");
    }

    print("Details loaded successfully.");
  } catch (e) {
    print("Error loading details: $e");
  }
}


  void resetFields() {
    name.value = '';
    idProofNumber.value = '';
    mobileNumber.value = '';
    pinCode.value = '';
    selectedProof.value = '';

    nameController.clear();
    idProofController.clear();
    mobileNumberController.clear();
    pinCodeController.clear();
    selectedProofController.clear();

    nameError.value = '';
    idProofNumberError.value = '';
    mobileNumberError.value = '';
    pinCodeError.value = '';
  }

   void delete(PartyModel partyModel) async {
    await partyModel.delete();
  }

}
  