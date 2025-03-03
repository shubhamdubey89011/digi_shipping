import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/signatory_details/model/other_signatories_model.dart';
import 'package:document_fill_demo/signatory_details/model/signatory_details_model.dart';
import 'package:document_fill_demo/db_helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondSignatoryController extends GetxController {
  late TextEditingController nameController;
  late FocusNode nameFocusNode;
  late TextEditingController idProofController;
  late FocusNode idProofFocusNode;
  late TextEditingController mobileNumberController;
  late FocusNode mobileNumberFocusNode;
  late TextEditingController emailController;
  late FocusNode emailFocusNode;
  late TextEditingController dobController;
  late FocusNode dobFocusNode;
  // late TextEditingController genderController;
  late FocusNode genderFocusNode;
  late TextEditingController relationshipController;
  late FocusNode relationshipFocusNode;
  late TextEditingController selectedProofController;
  late FocusNode selectedProofFocusNode;
  late TextEditingController selectedPartyController;
  late FocusNode selectedPartyFocusNode;

  RxBool isEditing = false.obs;

  RxString nameError = ''.obs;
  RxString idProofNumberError = ''.obs;
  RxString idGenderError = ''.obs;
  RxString mobileNumberError = ''.obs;
  RxString emailError = ''.obs;
  RxString dobError = ''.obs;
  RxString relationshipError = ''.obs;
  RxString partyError = ''.obs;
  RxString genderError = ''.obs;

  var isFormValid = false.obs;
  var formVisible = true.obs;
  var detailsSubmitted = false.obs;
  var hasData = false.obs;

  RxInt maleorfemale = 0.obs;

  RxList<SignatoryDetailsModel> partyDetailsList =
      <SignatoryDetailsModel>[].obs;
  RxList<OtherSignatoriesModel> othersignatoriesList =
      <OtherSignatoriesModel>[].obs;

  String id = '';
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
  RxBool isFirstPartyFormSubmitted = false.obs;

  var firstFormFilled = false.obs;
  var secondFormFilled = false.obs;
  var continueButtonEnabled = false.obs;

  Rxn<DateTime> selectedDate = Rxn<DateTime>();

  static const int maxInstances = 7;
  final RxList instances = [].obs;

  RxList<SecondSignatoryController> signatories =
      <SecondSignatoryController>[].obs;

  SecondSignatoryController() {
    nameController = TextEditingController();
    nameFocusNode = FocusNode();
    idProofController = TextEditingController();
    idProofFocusNode = FocusNode();
    mobileNumberController = TextEditingController();
    mobileNumberFocusNode = FocusNode();
    emailController = TextEditingController();
    emailFocusNode = FocusNode();
    dobController = TextEditingController();
    dobFocusNode = FocusNode();
    // genderController = TextEditingController();
    // genderFocusNode = FocusNode();
    relationshipController = TextEditingController();
    relationshipFocusNode = FocusNode();
    selectedProofController = TextEditingController();
    selectedProofFocusNode = FocusNode();
    selectedPartyController = TextEditingController();
    selectedPartyFocusNode = FocusNode();

    name.value = '';
    idProofNumber.value = '';
    mobileNumber.value = '';
    email.value = '';
    dob.value = '';
    // gender.value = '';
    relationship.value = '';
    selectedProof.value = '';
    selectedParty.value = '';
    formVisible.value = true;
  }

  String generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchExistingData();

    await firstFormCheckTableAndToggleForm();

    isFirstPartyFormSubmitted.value = await firstFormHasDataInTable();

    nameController.addListener(() {
      name.value = nameController.text;
      validateNameField();
    });

    idProofController.addListener(() {
      idProofNumber.value = idProofController.text;
      validateidProofNumberField();
    });

    mobileNumberController.addListener(() {
      mobileNumber.value = mobileNumberController.text;
      validatemobileNumberField();
    });

    emailController.addListener(() {
      email.value = emailController.text;
      validateEmail();
    });

    relationshipController.addListener(() {
      relationship.value = relationshipController.text;
      validateRelationship();
    });

    selectedPartyController.addListener(() {
      selectedParty.value = selectedPartyController.text;
      validateParty();
    });

    dobController.addListener(() {
      if (dobController.text.isNotEmpty) {
        dobError.value = '';
      }
    });
  }

  Future<bool> hasOtherSignatoryData() async {
    final data = await _dbHelper.fetchAllDetails(tableName: 'othersignatories');
    return data.isNotEmpty;
  }

  void addInstance() {
    if (instances.length < maxInstances) {
      final newInstance = SecondSignatoryController();
      newInstance.id = generateUniqueId();
      // newInstance.formVisible.value = true;
      instances.add(newInstance);
      instances.refresh();
    } else {
      print('Limit reached');
    }
  }

  Future<void> verifySavedDataBoth() async {
    final firstSignatoryData =
        await _dbHelper.fetchAllDetails(tableName: 'signatorydetails');
    final otherSignatoryData =
        await _dbHelper.fetchAllDetails(tableName: 'othersignatories');

    print("First Signatory Data: $firstSignatoryData");
    print("Other Signatory Data: $otherSignatoryData");
  }

  void toggleFormVisibility() async {
    formVisible.value = !formVisible.value;
    detailsSubmitted.value = !formVisible.value;
    isFirstPartyFormSubmitted.value = await firstFormHasDataInTable();
  }

  Future<void> checkTableAndToggleForm() async {
    final hasData = await hasDataInTable();
    print(hasData);
    formVisible.value = !hasData;
    detailsSubmitted.value = !hasData;
  }

  Future<void> firstFormCheckTableAndToggleForm() async {
    final hasData = await firstFormHasDataInTable();
    print(hasData);
    if (hasData) {
      formVisible.value = false;
      detailsSubmitted.value = true;
    } else {
      formVisible.value = true;
      detailsSubmitted.value = false;
    }
  }

  Future<void> saveDetails() async {
    try {
      final newPartyDetails = OtherSignatoriesModel(
        id: id,
        name: name.value,
        idProofNumber: idProofNumber.value,
        mobileNumber:
            mobileNumber.value.isNotEmpty ? int.parse(mobileNumber.value) : 0,
        email: email.value,
        dob: selectedDate.value?.toIso8601String() ?? '',
        gender: gender.value,
        relationship: relationship.value,
        selectedProof: selectedProof.value,
        selectedParty: selectedParty.value,
        formVisible: formVisible.value,
      );

      final existingRecord = await _dbHelper.fetchOtherSignatoryById(id);

      if (existingRecord != null) {
        await _dbHelper.updateDetails(
          tableName: 'othersignatories',
          data: newPartyDetails.toMap(),
        );
        print("Details updated successfully.");
      } else {
        await _dbHelper.insertData(
          tableName: 'othersignatories',
          data: newPartyDetails.toMap(),
        );
        print("Details saved successfully.");
      }

      othersignatoriesList.add(newPartyDetails);
      hasData.value = true;
    } catch (e) {
      print("Error saving/updating details: $e");
    }
  }

  Future<void> fetchExistingData() async {
    try {
      final data =
          await _dbHelper.fetchAllDetails(tableName: 'othersignatories');

      if (data.isNotEmpty) {
        for (var item in data) {
          final instance = SecondSignatoryController();
          instance.id = item['id'].toString();
          instance.name.value = item['name'].toString();
          instance.idProofNumber.value = item['idProofNumber'].toString();
          instance.mobileNumber.value = item['mobileNumber'].toString();
          instance.email.value = item['email'].toString();
          instance.dob.value = item['dob'].toString();
          instance.gender.value = item['gender'].toString();
          instance.relationship.value = item['relationship'].toString();
          instance.selectedProof.value = item['selectedProof'].toString();
          instance.selectedParty.value = item['selectedParty'].toString();
          instance.formVisible.value = item['formVisible'] == 1;

          instances.add(instance);
        }

        formVisible.value = false;
        detailsSubmitted.value = true;
      } else {
        formVisible.value = false;
        detailsSubmitted.value = false;
      }
    } catch (e) {
      print("Error fetching existing data: $e");
    }
  }

  void editDetails() async {
    try {
      await loadDetails();

      nameController.text = name.value.toString();
      idProofController.text = idProofNumber.value.toString();
      mobileNumberController.text = mobileNumber.value.toString();
      emailController.text = email.value.toString();
      // genderController.text = gender.value.toString();
      dobController.text = dob.value.toString();
      relationshipController.text = relationship.value.toString();
      selectedProofController.text = selectedProof.value.toString();
      selectedPartyController.text = selectedParty.value.toString();

      formVisible.value = true;
      isEditing.value = true;

      final newPartyDetails = OtherSignatoriesModel(
        id: id,
        name: name.value,
        idProofNumber: idProofNumber.value,
        mobileNumber:
            mobileNumber.value.isNotEmpty ? int.parse(mobileNumber.value) : 0,
        email: email.value,
        dob: selectedDate.value?.toIso8601String() ?? '',
        gender: gender.value,
        relationship: relationship.value,
        selectedProof: selectedProof.value,
        selectedParty: selectedParty.value,
        formVisible: formVisible.value,
      );

      final existingRecord = await _dbHelper.fetchOtherSignatoryById(id);

      if (existingRecord != null) {
        await _dbHelper.updateDetails(
          tableName: 'othersignatories',
          data: newPartyDetails.toMap(),
        );
        print("Details updated successfully.");
      } else {
        await _dbHelper.insertData(
          tableName: 'othersignatories',
          data: newPartyDetails.toMap(),
        );
        print("Details saved successfully.");
      }

      othersignatoriesList.add(newPartyDetails);
    } catch (e) {
      print("Error editing/saving details: $e");
    }
  }

  void handleFormSubmission() {
    if (isDetailsReadyToSubmit()) {
      print("Form is ready to submit. Saving details...");

      formVisible.value = false;
      print("formVisible set to false before saving.");
      print("formVisible after updating: ${formVisible.value}");
      saveDetails().then((_) {
        print("Details saved successfully.");
        verifySavedData();
        print("formVisible after saving: ${formVisible.value}");
        resetFields();
        isFirstPartyFormSubmitted.value = true;

        print("Form visibility toggled and fields reset.");
      }).catchError((error) {
        print("Error saving details: $error");

        formVisible.value = true;
        print("formVisible set to true due to error.");
      });
    } else {
      print("Form is not ready to submit. Validation failed.");
    }
  }

  Future<void> verifySavedData() async {
    final data = await _dbHelper.fetchAllDetails(tableName: 'othersignatories');
    print("Saved data in database: $data");
  }

  bool isDetailsReadyToSubmit() {
    final bool isReady = name.value.isNotEmpty &&
        idProofNumber.value.isNotEmpty &&
        selectedProof.value.isNotEmpty &&
        selectedParty.value.isNotEmpty &&
        relationship.value.isNotEmpty &&
        mobileNumber.value.isNotEmpty &&
        email.value.isNotEmpty &&
        dob.value.isNotEmpty &&
        // gender.value.isNotEmpty &&
        //
        nameError.value.isEmpty &&
        idProofNumberError.value.isEmpty &&
        relationshipError.value.isEmpty &&
        mobileNumberError.value.isEmpty &&
        emailError.value.isEmpty &&
        dobError.value.isEmpty;
    // genderError.value.isEmpty;

    if (!isReady) {
      debugPrint("Form is not ready to submit. Check the following:");
      if (name.value.isEmpty) debugPrint("Name is empty");
      if (idProofNumber.value.isEmpty) debugPrint("ID Proof Number is empty");
      if (selectedProof.value.isEmpty) debugPrint("Selected Proof is empty");
      if (selectedParty.value.isEmpty) debugPrint("Selected Party is empty");
      if (relationship.value.isEmpty) debugPrint("Relationship is empty");
      if (mobileNumber.value.isEmpty) debugPrint("Mobile Number is empty");
      if (email.value.isEmpty) debugPrint("Email is empty");
      if (dob.value.isEmpty) debugPrint("Date of Birth is empty");
      // if (gender.value.isEmpty) debugPrint("Gender is empty");
      if (nameError.value.isNotEmpty)
        debugPrint("Name Error: ${nameError.value}");
      if (idProofNumberError.value.isNotEmpty) {
        debugPrint("ID Proof Error: ${idProofNumberError.value}");
      }
      if (relationshipError.value.isNotEmpty) {
        debugPrint("Relationship Error: ${relationshipError.value}");
      }
      if (mobileNumberError.value.isNotEmpty) {
        debugPrint("Mobile Number Error: ${mobileNumberError.value}");
      }
      if (emailError.value.isNotEmpty) {
        debugPrint("Email Error: ${emailError.value}");
      }
      if (dobError.value.isNotEmpty) debugPrint("DOB Error: ${dobError.value}");
    }

    return isReady;
  }

  void validateNameField() {
    if (name.value.isEmpty) {
      nameError.value = 'Name is required';
    } else if (name.value.length < 2) {
      nameError.value = 'Invalid Name';
    } else {
      nameError.value = '';
    }
  }

  void validateParty() {
    idProofNumberError.value = idProofNumber.value.isEmpty
        ? 'Select Party first'
        : idProofNumber.value.length < 6
            ? 'Invalid Party selected '
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
    dobController.clear();
    relationshipController.clear();

    nameError.value = '';
    idProofNumberError.value = '';
    mobileNumberError.value = '';
    emailError.value = '';
    dobError.value = '';
    relationshipError.value = '';
  }

  void deleteAllDetailsAndOpenForm() async {
    await deleteInstanceById(id);
    checkTableAndToggleForm();
  }

  Future<bool> hasDataInTable() async {
    final data = await _dbHelper.fetchAllDetails(tableName: 'othersignatories');

    return data.isNotEmpty;
  }

  Future<void> checkData() async {
    hasData.value = await hasDataInTable();
  }

  Future<bool> firstFormHasDataInTable() async {
    final data = await _dbHelper.fetchAllDetails(
        tableName: DbHelperKeys.signatoryDetailsColumn);

    return data.isNotEmpty;
  }

  Future<void> deleteAllDetails() async {
    try {
      int rowsDeleted =
          await _dbHelper.deleteAllData(tableName: 'othersignatories');

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
      final data =
          await _dbHelper.fetchLastDetail(tableName: 'othersignatories');

      if (data != null) {
        name.value = data['name']?.toString() ?? '';
        idProofNumber.value = data['idProofNumber']?.toString() ?? '';
        mobileNumber.value = data['mobileNumber']?.toString() ?? '';
        email.value = data['email']?.toString() ?? '';
        selectedProof.value = data['selectedProof']?.toString() ?? '';
        // gender.value = data['gender']?.toString() ?? '';
        dob.value = data['dob']?.toString() ?? '';
        relationship.value = data['relationship']?.toString() ?? '';
        selectedParty.value = data['selectedParty']?.toString() ?? '';
        formVisible.value = data['formVisible'] == 1;

        partyDetailsList.add(SignatoryDetailsModel.fromMap(data));

        if (dob.value.isNotEmpty) {
          selectedDate.value = DateTime.parse(dob.value);
          dobController.text =
              "${selectedDate.value!.day}/${selectedDate.value!.month}/${selectedDate.value!.year}";
        }
      } else {
        print("No data found.");
      }
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
    dobController.dispose();
    // genderController.dispose();
    relationshipController.dispose();
    selectedProofController.dispose();
    selectedPartyController.dispose();

    nameFocusNode.dispose();
    idProofFocusNode.dispose();
    mobileNumberFocusNode.dispose();
    emailFocusNode.dispose();
    dobFocusNode.dispose();
    genderFocusNode.dispose();
    relationshipFocusNode.dispose();
    selectedPartyFocusNode.dispose();
    super.onClose();
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      selectedDate.value = picked;
      dob.value = picked.toIso8601String();
      dobController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  void clearDate() {
    selectedDate.value = null;
  }

  Future<void> deleteInstanceById(String id) async {
    try {
      await _dbHelper.deleteOtherSignatoryById(id);
      instances.removeWhere((instance) => instance.id == id);
      print("Instance deleted successfully.");
    } catch (e) {
      print("Error deleting instance: $e");
    }
  }

  Future<SignatoryDetailsModel?> fetchInstanceById(String id) async {
    try {
      final data = await _dbHelper.fetchOtherSignatoryById(id);
      if (data != null) {
        return SignatoryDetailsModel.fromMap(data);
      }
    } catch (e) {
      print("Error fetching instance: $e");
    }
    return null;
  }

  bool hasAnyInstanceWithData() {
    final hasData = instances.any((instance) =>
        instance.name.value.isNotEmpty &&
        instance.idProofNumber.value.isNotEmpty &&
        instance.mobileNumber.value.isNotEmpty &&
        instance.email.value.isNotEmpty &&
        instance.dob.value.isNotEmpty &&
        instance.relationship.value.isNotEmpty &&
        instance.selectedProof.value.isNotEmpty &&
        instance.selectedParty.value.isNotEmpty);

    print("Checking instances for data: $hasData");
    return hasData;
  }
}
