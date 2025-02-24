import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/signatory_details/model/signatory_details_model.dart';
import 'package:document_fill_demo/db_helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignatoryController extends GetxController {
  final nameController = TextEditingController();
  final idProofController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final relationshipController = TextEditingController();
  final selectedProofController = TextEditingController();
  final selectedPartyController = TextEditingController();

  final nameFocusNode = FocusNode();
  final idProofFocusNode = FocusNode();
  final mobileNumberFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final dobFocusNode = FocusNode();
  final genderFocusNode = FocusNode();
  final relationshipFocusNode = FocusNode();
  final partyFocusNode = FocusNode();
  RxBool isEditing = false.obs;

  RxString nameError = ''.obs;
  RxString idProofNumberError = ''.obs;
  RxString idGenderError = ''.obs;
  RxString mobileNumberError = ''.obs;
  RxString emailError = ''.obs;
  RxString dobError = ''.obs;
  RxString relationshipError = ''.obs;
  RxString partyError = ''.obs;

  final formKeyFirst = GlobalKey<FormState>();
  final formKeySecond = GlobalKey<FormState>();

  var isFormValid = false.obs;
  var formVisible = true.obs;
  var detailsSubmitted = false.obs;
  RxBool isFormSubmitted = false.obs;

  RxInt maleorfemale = 0.obs;

  RxList<SignatoryDetailsModel> partyDetailsList =
      <SignatoryDetailsModel>[].obs;

  RxString name = ''.obs;
  RxString idProofNumber = ''.obs;
  RxString mobileNumber = ''.obs;
  RxString email = ''.obs;
  RxString dob = ''.obs;
  RxString gender = ''.obs;
  RxString relationship = ''.obs;
  RxString selectedProof = ''.obs;
  RxString selectedParty = ''.obs;

  final DatabaseHelper _dbHelper = DatabaseHelper();
  var isFirstPartyFormSubmitted = false.obs;

  var secondFormVisible = false.obs;
  var otherFormVisible = false.obs;

  var firstFormFilled = false.obs;
  var secondFormFilled = false.obs;
  var continueButtonEnabled = false.obs;

  Rxn<DateTime> selectedDate = Rxn<DateTime>();

  var isFirstFormCompleted = false.obs;

  var showSecondSignatory = false.obs;
  final RxBool isSecondFormVisible = false.obs;
  var hasSecondSignatoryData = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await checkTableAndToggleForm();
    hasDataInSecondSignatory();

    nameController.addListener(validateNameField);
    idProofController.addListener(validateidProofNumberField);
    mobileNumberController.addListener(validatemobileNumberField);
    emailController.addListener(validateEmail);
    // genderController.addListener(validateGender);
    relationshipController.addListener(validateRelationship);
    selectedPartyController.addListener(validateParty);
    // dobController.addListener(validateDOB);
  }

  //

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

  void editDetails() {
    loadDetails().then((_) {
      nameController.text = name.value.toString();
      idProofController.text = idProofNumber.value.toString();
      mobileNumberController.text = mobileNumber.value.toString();
      emailController.text = email.value.toString();
      genderController.text = gender.value.toString();
      dobController.text = dob.value.toString();
      relationshipController.text = relationship.value.toString();
      selectedProofController.text = selectedProof.value.toString();
      selectedPartyController.text = selectedParty.value.toString();

      // toggleFormVisibility();
      formVisible.value = true;
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
      isFirstPartyFormSubmitted.value = true;
    }
  }

  bool isDetailsReadyToSubmit() {
    print("Checking form readiness:");
    print("Name: ${name.value}");
    print("ID Proof: ${idProofNumber.value}");
    print("Party: ${selectedParty.value}");
    print("Relationship: ${relationship.value}");
    print("Mobile: ${mobileNumber.value}");
    print("Email: ${email.value}");

    print("Name Error: ${nameError.value}");
    print("ID Proof Error: ${idProofNumberError.value}");
    print("Party Error: ${partyError.value}");
    print("Relationship Error: ${relationshipError.value}");
    print("Mobile Error: ${mobileNumberError.value}");
    print("Gender Error: ${idGenderError.value}");
    print("Email Error: ${emailError.value}");

    bool ready = name.value.isNotEmpty &&
        idProofNumber.value.isNotEmpty &&
        selectedParty.value.isNotEmpty &&
        relationship.value.isNotEmpty &&
        mobileNumber.value.isNotEmpty &&
        idGenderError.value.isEmpty &&
        email.value.isNotEmpty &&
        nameError.value.isEmpty &&
        idProofNumberError.value.isEmpty &&
        // partyError.value.isEmpty &&
        relationshipError.value.isEmpty &&
        mobileNumberError.value.isEmpty &&
        idGenderError.value.isEmpty &&
        emailError.value.isEmpty;

    print("Form Ready: $ready");
    return ready;
  }

  void validateNameField() {
    nameError.value = name.value.isEmpty
        ? 'Name is required'
        : name.value.length < 2
            ? 'Invalid Name '
            : '';
  }

  void validateParty() {
    // partyError.value = partyError.value.isEmpty
    if (selectedProof.value.isEmpty) {
      idProofNumberError.value = 'Please select a Party Type';
      return;
    }
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
                ? 'Invalid Aadhaar Number'
                : '';
        break;

      case 'Voter ID Card':
        idProofNumberError.value = idProofNumber.value.isEmpty
            ? 'Voter ID is required'
            : !RegExp(r'^[A-Z,a-z]{3}[0-9]{7}$').hasMatch(idProofNumber.value)
                ? 'Invalid Voter ID '
                : '';
        break;

      case 'PAN Card':
        idProofNumberError.value = idProofNumber.value.isEmpty
            ? 'PAN Card number is required'
            : !RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$').hasMatch(idProofNumber.value)
                ? 'Invalid PAN Card '
                : '';
        break;

      case 'Passport':
        idProofNumberError.value = idProofNumber.value.isEmpty
            ? 'Passport Number is required'
            : !RegExp(r'^[A-Z][0-9]{7}$').hasMatch(idProofNumber.value)
                ? 'Invalid Passport Number'
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
            ? 'Enter a valid mobile number '
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
    relationship.value = '';
    dob.value = '';

    nameController.clear();
    idProofController.clear();
    mobileNumberController.clear();
    emailController.clear();
    selectedProofController.clear();
    selectedPartyController.clear();
    relationshipController.clear();
    dobController.clear();

    nameError.value = '';
    idProofNumberError.value = '';
    mobileNumberError.value = '';
    emailError.value = '';
    relationshipError.value = '';
  }

  void deleteAllDetailsAndOpenForm() async {
    await deleteAllDetails();
    checkTableAndToggleForm();
    resetFields();
  }

  Future<bool> hasDataInTable() async {
    final data = await _dbHelper.fetchAllDetails(
        tableName: DbHelperKeys.signatoryDetailsColumn);
    print("Fetched data from table: $data");
    return data.isNotEmpty;
  }

  Future<bool> hasDataInSecondSignatory() async {
    final data = await _dbHelper.fetchAllDetails(
        tableName: DbHelperKeys.secondsignatoryDetailsColumn);
    print("Fetched data from table: $data");
    return data.isNotEmpty;
  }

  Future<void> checkSecondSignatory() async{
    hasSecondSignatoryData.value = await hasDataInSecondSignatory();
  }

  Future<void> deleteAllDetails() async {
    try {
      int rowsDeleted =
          await _dbHelper.deleteAllData(tableName: 'signatorydetails');

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

  Future<void> saveDetails() async {
    try {
      final newPartyDetails = SignatoryDetailsModel(
        name: name.value,
        idProofNumber: idProofNumber.value,
        mobileNumber: int.parse(mobileNumber.value),
        email: email.value,
        dob: selectedDate.value?.toIso8601String() ?? '',
        gender: gender.value,
        relationship: relationship.value,
        selectedProof: selectedProof.value,
        selectedParty: selectedParty.value,
      );

      await _dbHelper.insertData(
        data: newPartyDetails.toMap(),
        tableName: 'signatorydetails',
      );

      partyDetailsList.add(newPartyDetails);
      print(newPartyDetails);
      print("Details saved successfully.");
    } catch (e) {
      print("Error saving details: $e");
    }
  }

  Future<void> loadDetails() async {
    try {
      final data = await _dbHelper.fetchLastDetail(
          tableName: DbHelperKeys.signatoryDetailsColumn);

      if (data != null) {
        name.value = data['name']?.toString() ?? '';
        idProofNumber.value = data['idProofNumber']?.toString() ?? '';
        mobileNumber.value = data['mobileNumber']?.toString() ?? '';
        email.value = data['email']?.toString() ?? '';
        selectedProof.value = data['selectedProof']?.toString() ?? '';
        gender.value = data['gender']?.toString() ?? '';
        dob.value = data['dob']?.toString() ?? '';
        relationship.value = data['relationship']?.toString() ?? '';
        selectedParty.value = data['selectedParty']?.toString() ?? '';

        if (dob.value.isNotEmpty) {
          selectedDate.value = DateTime.parse(dob.value);
          dobController.text =
              "${selectedDate.value!.day}/${selectedDate.value!.month}/${selectedDate.value!.year}";
        }

        partyDetailsList.add(SignatoryDetailsModel.fromMap(data));
        print('Fetched data:  $dob, $gender, $selectedParty');
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
    relationshipController.dispose();
    dobController.dispose();
    selectedPartyController.dispose();
    genderController.dispose();
    nameFocusNode.dispose();
    idProofFocusNode.dispose();
    mobileNumberFocusNode.dispose();
    emailFocusNode.dispose();
    relationshipFocusNode.dispose();
    dobFocusNode.dispose();
    partyFocusNode.dispose();
    genderFocusNode.dispose();

    super.onClose();
  }

  // Future<void> pickDate(BuildContext context) async {
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );

  //   if (pickedDate != null) {
  //     selectedDate.value = pickedDate;
  //     dobController.text =
  //         "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  //   }
  // }

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  void clearDate() {
    selectedDate.value = null;
  }
}
