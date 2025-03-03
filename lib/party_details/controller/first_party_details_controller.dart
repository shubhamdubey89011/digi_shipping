import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/party_details/model/party_details_model.dart';
import 'package:document_fill_demo/db_helper/db_helper.dart';
import 'package:document_fill_demo/party_details/model/party_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartyDetailsController extends GetxController {
  final firstPartyNameController = TextEditingController();
  final firstPartyIdProofController = TextEditingController();
  final firstPartyMobileNumberController = TextEditingController();
  final firstPartyPinCodeController = TextEditingController();
  final firstPartySelectedProofController = TextEditingController();

  final secondPartyNameController = TextEditingController();
  final secondPartyIdProofController = TextEditingController();
  final secondPartyMobileNumberController = TextEditingController();
  final secondPartyPinCodeController = TextEditingController();
  final secondPartySelectedProofController = TextEditingController();

  final nameFocusNode = FocusNode();
  final idProofFocusNode = FocusNode();
  final mobileNumberFocusNode = FocusNode();
  final pinCodeFocusNode = FocusNode();
  RxBool isEditing = false.obs;

  final secondPartynameFocusNode = FocusNode();
  final secondPartyidProofFocusNode = FocusNode();
  final secondPartymobileNumberFocusNode = FocusNode();
  final secondPartypinCodeFocusNode = FocusNode();
  RxBool secondPartyIsEditing = false.obs;

  RxString nameError = ''.obs;
  RxString idProofNumberError = ''.obs;
  RxString mobileNumberError = ''.obs;
  RxString pinCodeError = ''.obs;

  RxString secondPartynameError = ''.obs;
  RxString secondPartyidProofNumberError = ''.obs;
  RxString secondPartymobileNumberError = ''.obs;
  RxString secondPartypinCodeError = ''.obs;

  var isFormValid = false.obs;
  var formVisible = true.obs;
  var detailsSubmitted = false.obs;

  var secondPartyisFormValid = false.obs;
  var secondPartyformVisible = false.obs;
  var secondPartydetailsSubmitted = false.obs;
  var secondPartysecondFormVisible = true.obs;

  RxList<PartyDetails> partyDetailsList = <PartyDetails>[].obs;

  RxString name = ''.obs;
  RxString idProofNumber = ''.obs;
  RxString mobileNumber = ''.obs;
  RxString pinCode = ''.obs;
  RxString selectedProof = ''.obs;

  final DatabaseHelper _dbHelper = DatabaseHelper();

  var isFirstPartyFormSubmitted = false.obs;
  RxBool isFormSubmitted = false.obs;
  var isseconpartydetailssubmitted = false.obs;
  var isFirstFormCompleted = false.obs;

  //  RxList<PartyDetails> seconPartyDetailsList = <PartyDetails>[].obs;

  RxString secondPartyname = ''.obs;
  RxString secondPartyidProofNumber = ''.obs;
  RxString secondPartymobileNumber = ''.obs;
  RxString secondPartypinCode = ''.obs;
  RxString secondPartyselectedProof = ''.obs;

  // final DatabaseHelper _dbHelper = DatabaseHelper();

  RxBool secondPartyisDataStored = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await checkTableAndToggleForm();
    isFirstFormCompleted.value = await hasDataInTable();
    initializeFirstPartyListeners();

    secondPartycheckTableAndToggleForm();
    seconPartyinitializeFormListeners();
  }

  void seconPartyinitializeFormListeners() {
    secondPartyNameController.addListener(secondPartyvalidateNameField);
    secondPartyIdProofController
        .addListener(secondPartyvalidateidProofNumberField);
    secondPartyMobileNumberController
        .addListener(secondPartyvalidatemobileNumberField);
    secondPartyPinCodeController.addListener(secondPartyvalidatepinCodeField);
  }

  void initializeFirstPartyListeners() {
    firstPartyNameController.addListener(validateNameField);
    firstPartyIdProofController.addListener(validateidProofNumberField);
    firstPartyMobileNumberController.addListener(validatemobileNumberField);
    firstPartyPinCodeController.addListener(validatepinCodeField);
  }

  void toggleFormVisibility() {
    formVisible.value = !formVisible.value;
    detailsSubmitted.value = !formVisible.value;
    isFormSubmitted.value = true;
  }

  Future<void> checkTableAndToggleForm() async {
    final hasData = await hasDataInTable();
    print(hasData);
    if (hasData) {
      formVisible.value = false;
      detailsSubmitted.value = true;
    } else {
      formVisible.value = true;
      detailsSubmitted.value = false;
    }
  }

  void handleFormSubmission() {
    if (isDetailsReadyToSubmit()) {
      saveDetails();
      resetFields();
      isFirstFormCompleted.value = true;
      Get.showSnackbar(GetSnackBar(
        message: 'Details saved locally in SQLite!',
        duration: const Duration(seconds: 2),
      ));
      toggleFormVisibility();
    }
  }

  bool isDetailsReadyToSubmit() {
    return name.value.isNotEmpty &&
        idProofNumber.value.isNotEmpty &&
        mobileNumber.value.isNotEmpty &&
        pinCode.value.isNotEmpty &&
        nameError.value.isEmpty &&
        idProofNumberError.value.isEmpty &&
        mobileNumberError.value.isEmpty &&
        pinCodeError.value.isEmpty;
    // hasFormData();
  }

  void deleteAllDetailsAndOpenForm() async {
    await deleteAllDetails();
    checkTableAndToggleForm();
  }

  Future<bool> hasDataInTable() async {
    final data = await _dbHelper.fetchAllDetails(
        tableName: DbHelperKeys.firstSignatoryDetailsColumn);
    print("Fetched data from first party table: $data");
    return data.isNotEmpty;
  }

  Future<void> saveDetails() async {
    try {
      final newPartyDetails = PartyDetails(
        name: name.value.toString(),
        idProofNumber: idProofNumber.value,
        mobileNumber: int.parse(mobileNumber.value),
        pinCode: int.parse(pinCode.value),
        selectedProof: selectedProof.value.toString(),
      );

      await _dbHelper.insertData(
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
      firstPartyNameController.text = name.value.toString();
      firstPartyIdProofController.text = idProofNumber.value.toString();
      firstPartyMobileNumberController.text = mobileNumber.value.toString();
      firstPartyPinCodeController.text = pinCode.value.toString();
      firstPartySelectedProofController.text = selectedProof.value.toString();

      formVisible.value = true;
    });
  }

  void validateNameField() {
    nameError.value = name.value.isEmpty
        ? 'Name is required'
        : !RegExp(r'^[A-Za-z ]{3,25}$').hasMatch(name.value)
            ? 'Invalid Name'
            : '';
  }

  void validateidProofNumberField() {
    if (selectedProof.value.isEmpty) {
      idProofNumberError.value = 'Please select an ID Proof';
      return;
    }

    switch (selectedProof.value) {
      case 'Aadhaar Card':
        idProofNumberError.value = idProofNumber.value.isEmpty
            ? 'Aadhaar Number is required'
            : !RegExp(r'^\d{12}$').hasMatch(idProofNumber.value)
                ? 'Invalid Aadhaar Card Number'
                : '';
        break;

      case 'Voter ID Card':
        idProofNumberError.value = idProofNumber.value.isEmpty
            ? 'Voter ID is required'
            : !RegExp(r'^[A-Z,a-z]{3}[0-9]{7}$').hasMatch(idProofNumber.value)
                ? 'Invalid VOTER ID'
                : '';
        break;

      case 'PAN Card':
        idProofNumberError.value = idProofNumber.value.isEmpty
            ? 'PAN Card number is required'
            : !RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$').hasMatch(idProofNumber.value)
                ? 'Invalid PAN Card Number'
                : '';
        break;

      case 'Passport':
        idProofNumberError.value = idProofNumber.value.isEmpty
            ? 'Passport Number is required'
            : !RegExp(r'^[A-Z][0-9]{7}$').hasMatch(idProofNumber.value)
                ? 'Invalid Passport'
                : '';
        break;

      default:
        idProofNumberError.value = '';
    }
  }

  void validatemobileNumberField() {
    mobileNumberError.value = mobileNumber.value.isEmpty
        ? 'Mobile Number is required'
        : !RegExp(r'^[6789]\d{9}$').hasMatch(mobileNumber.value)
            ? 'Invalid Mobile Number'
            : '';
  }

  void validatepinCodeField() {
    pinCodeError.value = pinCode.value.isEmpty
        ? 'Pin Code is required'
        : !RegExp(r'^[0-9]{6}$').hasMatch(pinCode.value)
            ? 'Invalid PinCode'
            : '';
  }

  Future<void> deleteAllDetails() async {
    try {
      int rowsDeleted =
          await _dbHelper.deleteAllData(tableName: 'firstpartydetails');

      if (rowsDeleted > 0) {
        print("All details deleted successfully.");
        partyDetailsList.clear();
      } else {
        print("No details found to delete.");
      }
    } catch (e) {
      print("Error deleting details: $e");
    }
    resetFields();
  }

  Future<void> loadDetails() async {
    try {
      final data =
          await _dbHelper.fetchLastDetail(tableName: 'firstpartydetails');

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

    firstPartyNameController.clear();
    firstPartyIdProofController.clear();
    firstPartyMobileNumberController.clear();
    firstPartyPinCodeController.clear();
    firstPartySelectedProofController.clear();

    nameError.value = '';
    idProofNumberError.value = '';
    mobileNumberError.value = '';
    pinCodeError.value = '';
  }

  void delete(PartyModel partyModel) async {
    await partyModel.delete();
  }

  void secondPartytoggleFormVisibility() async {
    secondPartyformVisible.value = !secondPartyformVisible.value;
    secondPartydetailsSubmitted.value = !secondPartyformVisible.value;
    isFirstFormCompleted.value = await hasDataInTable();
  }

  Future<void> secondPartycheckTableAndToggleForm() async {
    final hasDataInDB = await secondPartyhasDataInTable();
    print("hasdata secondParty =  $hasDataInDB");
    secondPartyformVisible.value = !hasDataInDB;
    secondPartydetailsSubmitted.value = !hasDataInDB;
  }

   

  Future<bool> secondPartyhasDataInTable() async {
    final data =
        await _dbHelper.fetchAllDetails(tableName: 'secondpartydetails');
    print("Fetched data from second table : $data");
    return data.isNotEmpty;
  }

  void secondPartyhandleFormSubmission() {
    if (secondPartyisDetailsReadyToSubmit()) {
      secondPartysaveDetails1();
      secondPartyresetFields();

      Get.showSnackbar(GetSnackBar(
        message: 'Details saved locally in SQLite!',
        duration: const Duration(seconds: 2),
      ));
      secondPartytoggleFormVisibility();
    }
  }

  bool secondPartyisDetailsReadyToSubmit() {
    return secondPartyname.value.isNotEmpty &&
        secondPartyidProofNumber.value.isNotEmpty &&
        secondPartymobileNumber.value.isNotEmpty &&
        secondPartypinCode.value.isNotEmpty &&
        secondPartynameError.value.isEmpty &&
        secondPartyidProofNumberError.value.isEmpty &&
        secondPartymobileNumberError.value.isEmpty &&
        secondPartypinCodeError.value.isEmpty;
  }

  void secondPartydeleteAllDetailsAndOpenForm() async {
    await secondPartydeleteAllDetails();
    secondPartycheckTableAndToggleForm();
    secondPartyisDataStored.value = false;
  }

  Future<void> secondPartysaveDetails1() async {
    try {
      final newPartyDetails = PartyDetails(
        name: secondPartyname.value,
        idProofNumber: secondPartyidProofNumber.value,
        mobileNumber: int.parse(secondPartymobileNumber.value),
        pinCode: int.parse(secondPartypinCode.value),
        selectedProof: secondPartyselectedProof.value,
      );

      await _dbHelper.insertData(
        data: newPartyDetails.toMap(),
        tableName: 'secondpartydetails',
      );

      partyDetailsList.add(newPartyDetails);

      print("Details saved successfully.");
    } catch (e) {
      print("Error saving details: $e");
    }
  }

  void secondPartyeditDetails() {
    secondPartyloadDetails().then((_) {
      secondPartyNameController.text = secondPartyname.value.toString();
      secondPartyIdProofController.text =
          secondPartyidProofNumber.value.toString();
      secondPartyMobileNumberController.text =
          secondPartymobileNumber.value.toString();
      secondPartyPinCodeController.text = secondPartypinCode.value.toString();
      secondPartySelectedProofController.text =
          secondPartyselectedProof.value.toString();

      // toggleFormVisibility();
      secondPartyformVisible.value = true;
    });
  }

  Future<void> secondPartydeleteAllDetails() async {
    try {
      int rowsDeleted =
          await _dbHelper.deleteAllData(tableName: 'secondpartydetails');

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

  Future<void> secondPartyloadDetails() async {
    try {
      final data =
          await _dbHelper.fetchLastDetail(tableName: 'secondpartydetails');

      if (data != null) {
        secondPartyname.value = data['name']?.toString() ?? '';
        secondPartyidProofNumber.value =
            data['idProofNumber']?.toString() ?? '';
        secondPartymobileNumber.value = data['mobileNumber']?.toString() ?? '';
        secondPartypinCode.value = data['pinCode']?.toString() ?? '';
        secondPartyselectedProof.value =
            data['selectedProof']?.toString() ?? '';

        partyDetailsList.add(PartyDetails.fromMap(data));

        print(
            'Fetched data for second form: $secondPartyname, $secondPartyidProofNumber, $secondPartymobileNumber, $secondPartypinCode, $secondPartyselectedProof');
      } else {
        print("No data found.");
      }

      print("Details loaded successfully.");
    } catch (e) {
      print("Error loading details: $e");
    }
  }

  void secondPartyvalidateNameField() {
    nameError.value = secondPartyname.value.isEmpty
        ? 'Name is required'
        : !RegExp(r'^[A-Za-z ]{3,25}$').hasMatch(secondPartyname.value)
            ? 'Invalid Name'
            : '';
  }

  void secondPartyvalidateidProofNumberField() {
    if (secondPartyselectedProof.value.isEmpty) {
      secondPartyidProofNumberError.value = 'Please select an ID Proof';
      return;
    }

    switch (secondPartyselectedProof.value) {
      case 'Aadhaar Card':
        secondPartyidProofNumberError.value =
            secondPartyidProofNumber.value.isEmpty
                ? 'Aadhaar Number is required'
                : !RegExp(r'^\d{12}$').hasMatch(secondPartyidProofNumber.value)
                    ? 'Invalid Aadhaar Card Number'
                    : '';
        break;

      case 'Voter ID Card':
        secondPartyidProofNumberError.value =
            secondPartyidProofNumber.value.isEmpty
                ? 'Voter ID is required'
                : !RegExp(r'^[A-Z,a-z]{3}[0-9]{7}$')
                        .hasMatch(secondPartyidProofNumber.value)
                    ? 'Invalid VOTER ID'
                    : '';
        break;

      case 'PAN Card':
        secondPartyidProofNumberError.value =
            secondPartyidProofNumber.value.isEmpty
                ? 'PAN Card number is required'
                : !RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$')
                        .hasMatch(secondPartyidProofNumber.value)
                    ? 'Invalid PAN Card Number'
                    : '';
        break;

      case 'Passport':
        secondPartyidProofNumberError.value =
            secondPartyidProofNumber.value.isEmpty
                ? 'Passport Number is required'
                : !RegExp(r'^[A-Z][0-9]{7}$')
                        .hasMatch(secondPartyidProofNumber.value)
                    ? 'Invalid Passport'
                    : '';
        break;

      default:
        secondPartyidProofNumberError.value = '';
    }
  }

  void secondPartyvalidatemobileNumberField() {
    secondPartymobileNumberError.value = secondPartymobileNumber.value.isEmpty
        ? 'Mobile Number is required'
        : !RegExp(r'^[6789]\d{9}$').hasMatch(secondPartymobileNumber.value)
            ? 'Invalid Mobile Number'
            : '';
  }

  void secondPartyvalidatepinCodeField() {
    secondPartypinCodeError.value = secondPartypinCode.value.isEmpty
        ? 'Pin Code is required'
        : !RegExp(r'^[0-9]{6}$').hasMatch(secondPartypinCode.value)
            ? 'Invalid PinCode'
            : '';
  }

  void secondPartyresetFields() {
    secondPartyname.value = '';
    secondPartyidProofNumber.value = '';
    secondPartymobileNumber.value = '';
    secondPartypinCode.value = '';
    secondPartyselectedProof.value = '';

    secondPartyNameController.clear();
    secondPartyIdProofController.clear();
    secondPartyMobileNumberController.clear();
    secondPartyPinCodeController.clear();
    secondPartySelectedProofController.clear();

    secondPartynameError.value = '';
    secondPartyidProofNumberError.value = '';
    secondPartymobileNumberError.value = '';
    secondPartypinCodeError.value = '';
  }

  bool secondPartyhasFormData() {
    return secondPartyname.value.isNotEmpty &&
        secondPartymobileNumber.value.isNotEmpty &&
        secondPartyselectedProof.value.isNotEmpty &&
        secondPartyidProofNumber.value.isNotEmpty &&
        secondPartypinCode.value.isNotEmpty;
  }
}
