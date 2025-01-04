import 'package:document_fill_demo/party_details/view/db_helper.dart';
import 'package:get/get.dart';



class PartyDetails {
  String name;
  String idProofNumber;
  String mobileNumber;
  String pinCode;
  String selectedProof;

  PartyDetails({
    required this.name,
    required this.idProofNumber,
    required this.mobileNumber,
    required this.pinCode,
    required this.selectedProof,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'idProofNumber': idProofNumber,
      'mobileNumber': mobileNumber,
      'pinCode': pinCode,
      'selectedProof': selectedProof,
    };
  }
}

class FirstPartyDetailsModel {
  RxList<PartyDetails> partyDetailsList = <PartyDetails>[].obs;

RxString name = ''.obs;
  RxString idProofNumber = ''.obs;
  RxString mobileNumber = ''.obs;
  RxString pinCode = ''.obs;
  RxString selectedProof = ''.obs;

  // Error messages
  RxString nameError = ''.obs;
  RxString idProofNumberError = ''.obs;
  RxString mobileNumberError = ''.obs;
  RxString pinCodeError = ''.obs;

  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Save to SQLite and add to list
  Future<void> saveDetails() async {
    final newPartyDetails = PartyDetails(
      name: name.value,
      idProofNumber: idProofNumber.value,
      mobileNumber: mobileNumber.value,
      pinCode: pinCode.value,
      selectedProof: selectedProof.value,
    );

    // Insert into SQLite
    await _dbHelper.insertPartyDetails(newPartyDetails.toMap());

    // Add to local list
    partyDetailsList.add(newPartyDetails);
  }

  // Fetch all details from SQLite
  Future<void> loadDetails() async {
    final data = await _dbHelper.fetchAllPartyDetails();
    partyDetailsList.clear();
    partyDetailsList.addAll(
      data.map((e) => PartyDetails(
        name: e['name'],
        idProofNumber: e['idProofNumber'],
        mobileNumber: e['mobileNumber'],
        pinCode: e['pinCode'],
        selectedProof: e['selectedProof'],
      )),
    );
  }
}
