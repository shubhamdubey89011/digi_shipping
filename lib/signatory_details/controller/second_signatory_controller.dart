import 'package:document_fill_demo/party_details/db_helper/db_helper_keys.dart';
import 'package:document_fill_demo/signatory_details/model/signatory_details_model.dart';
import 'package:document_fill_demo/party_details/db_helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondSignatoryController extends GetxController {
  final nameController = TextEditingController();
  final idProofController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  // final dobController = TextEditingController();
  final genderController = TextEditingController();
  final relationshipController = TextEditingController();
  final selectedProofController = TextEditingController();
  final selectedPartyController = TextEditingController();

  final nameFocusNode = FocusNode();
  final idProofFocusNode = FocusNode();
  final mobileNumberFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  // final dobFocusNode = FocusNode();
  final genderFocusNode = FocusNode();
  final relationshipFocusNode = FocusNode();
  final partyFocusNode = FocusNode();
  dynamic isEditing = false.obs;

  RxString nameError = ''.obs;
  RxString idProofNumberError = ''.obs;
  RxString idGenderError = ''.obs;
  RxString mobileNumberError = ''.obs;
  RxString emailError = ''.obs;
  // RxString dobError = ''.obs;
  RxString relationshipError = ''.obs;
  RxString partyError = ''.obs;

  var isFormValid = false.obs;
  var formVisible = true.obs;
  var detailsSubmitted = false.obs;

  final RxInt maleorfemale = 0.obs;

  RxList<SignatoryDetailsModel> partyDetailsList =
      <SignatoryDetailsModel>[].obs;

  RxString name = ''.obs;
  RxString idProofNumber = ''.obs;
  RxString mobileNumber = ''.obs;
  RxString email = ''.obs;
  // RxString dob = ''.obs;
  RxString gender = ''.obs;
  RxString relationship = ''.obs;
  RxString selectedProof = ''.obs;
  RxString selectedParty = ''.obs;

  final DatabaseHelper _dbHelper = DatabaseHelper();

  var secondFormVisible = false.obs;

  var firstFormFilled = false.obs;
  var secondFormFilled = false.obs;
  var continueButtonEnabled = false.obs;

  void checkFormsCompletion() {
    continueButtonEnabled.value =
        firstFormFilled.value && secondFormFilled.value;
  }

  void toggleFirstFormFilled() {
    firstFormFilled.value = true;
    checkFormsCompletion();
  }

  void toggleSecondFormFilled() {
    secondFormFilled.value = true;
    checkFormsCompletion();
  }

  @override
  void onInit() async {
    super.onInit();
    await checkTableAndToggleForm();

    nameController.addListener(validateNameField);
    idProofController.addListener(validateidProofNumberField);
    mobileNumberController.addListener(validatemobileNumberField);
    emailController.addListener(validateEmail);
    // genderController.addListener(validateGender);
    relationshipController.addListener(validateRelationship);
    selectedPartyController.addListener(validateParty);
    // dobController.addListener(validateDOB);
  }

  void toggleSecondForm() {
    secondFormVisible.value = !secondFormVisible.value;
  }

  void toggleFormVisibility() {
    formVisible.value = !formVisible.value;
    detailsSubmitted.value = !formVisible.value;
  }

  Future<void> checkTableAndToggleForm() async {
    final hasData = await hasDataInTable();
    print(hasData);
    formVisible.value = !hasData;
    detailsSubmitted.value = !hasData; // Hide the form if data exists
  }

  void editDetails() {
    loadDetails().then((_) {
      nameController.text = name.value.toString();
      idProofController.text = idProofNumber.value.toString();
      mobileNumberController.text = mobileNumber.value.toString();
      emailController.text = email.value.toString();
      genderController.text = gender.value.toString();
      // dobController.text = dob.value.toString();
      relationshipController.text = relationship.value.toString();
      selectedProofController.text = selectedProof.value.toString();
      selectedPartyController.text = selectedParty.value.toString();

      toggleFormVisibility();
    });
  }

  void handleFormSubmission() {
    if (isDetailsReadyToSubmit()) {
      saveDetails();
      resetFields();
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
        partyError.value.isEmpty &&
        relationshipError.value.isEmpty &&
        mobileNumberError.value.isEmpty &&
        // idGenderError.value.isEmpty &&
        emailError.value.isEmpty;
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

  void validateParty() {
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

  void validateEmail() {
    emailError.value = email.value.isEmpty
        ? 'Email is required'
        : !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                .hasMatch(email.value)
            ? 'Enter a valid email address'
            : '';
  }

  void validateRelationship() {
    relationshipError.value = relationship.value.isEmpty
        ? 'Message is required'
        : relationship.value.length > 50
            ? 'Message must not exceed 50 characters'
            : '';
  }

  void resetFields() {
    name.value = '';
    idProofNumber.value = '';
    mobileNumber.value = '';
    email.value = '';
    selectedProof.value = '';
    selectedParty.value = '';

    nameController.clear();
    idProofController.clear();
    mobileNumberController.clear();
    emailController.clear();
    selectedProofController.clear();
    selectedPartyController.clear();

    nameError.value = '';
    idProofNumberError.value = '';
    mobileNumberError.value = '';
    emailError.value = '';
  }

  void deleteAllDetailsAndOpenForm() async {
    await deleteAllDetails();
    checkTableAndToggleForm();
  }

Future<void> saveDetails() async {
    try {
      final newPartyDetails = SignatoryDetailsModel(
        name: name.value,
        idProofNumber: int.parse(idProofNumber.value),
        mobileNumber: int.parse(mobileNumber.value),
        email: email.value,
        // dob: dob.value,
        gender: gender.value,
        relationship: relationship.value,
        selectedProof: selectedProof.value,
        selectedParty: selectedParty.value,
      );

      await _dbHelper.insertDatToSqLite3(
        data: newPartyDetails.toMap(),
        tableName: DbHelperKeys.secondsignatoryDetailsColumn,
      );

      partyDetailsList.add(newPartyDetails);

      print("Details saved successfully.");
    } catch (e) {
      print("Error saving details: $e");
      
    }
  }




  Future<bool> hasDataInTable() async {
    final data =
        await _dbHelper.fetchAllPartyDetails3(tableName: DbHelperKeys.secondsignatoryDetailsColumn);
    print("Fetched data from table: $data"); 
    return data.isNotEmpty;
  }

  Future<void> deleteAllDetails() async {
    try {
      int rowsDeleted = await _dbHelper.deleteAllDataFromTable3(
          tableName: DbHelperKeys.secondsignatoryDetailsColumn);

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
      final data =
          await _dbHelper.fetchLastPartyDetail3(tableName: DbHelperKeys.secondsignatoryDetailsColumn);

      if (data != null) {
        name.value = data['name']?.toString() ?? '';
        idProofNumber.value = data['idProofNumber']?.toString() ?? '';
        mobileNumber.value = data['mobileNumber']?.toString() ?? '';
        email.value = data['email']?.toString() ?? '';
        selectedProof.value = data['selectedProof']?.toString() ?? '';
        gender.value = data['gender']?.toString() ?? '';
        // dob.value = data['dob']?.toString() ?? '';
        relationship.value = data['relationship']?.toString() ?? '';
        selectedParty.value = data['party']?.toString() ?? '';

        partyDetailsList.add(SignatoryDetailsModel.fromMap(data));

        print(
            'Fetched data: $name, $idProofNumber, $mobileNumber, $email, $selectedProof, $selectedParty');
      } else {
        print("No data found.");
      }

      print("Details loaded successfully.");
    } catch (e) {
      print("Error loading details: $e");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    idProofController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    nameFocusNode.dispose();
    idProofFocusNode.dispose();
    mobileNumberFocusNode.dispose();
    emailFocusNode.dispose();
    super.onClose();
  }

  // void navigateDashboard(){
  //    Get.to(() => DashboardView());
  // }
}
