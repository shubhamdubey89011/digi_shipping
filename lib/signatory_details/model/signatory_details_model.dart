

class SignatoryDetailsModel {
  String name;
  int idProofNumber;
  int mobileNumber;
  String email;
  String selectedProof;
  String relationship;
  // String dob;
  String gender;
  String selectedParty;

  SignatoryDetailsModel({
    required this.name,
    required this.idProofNumber,
    required this.mobileNumber,
    required this.email,
    required this.selectedProof,
    required this.relationship,
    // required this.dob,
    required this.gender,
    required this.selectedParty,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'idProofNumber': idProofNumber,
      'mobileNumber': mobileNumber,
      'email': email,
      'selectedProof': selectedProof,
      'relationship': relationship,
      // 'dob': dob,
      'gender': gender,
      'selectedParty': selectedParty,
    };
  }

  factory SignatoryDetailsModel.fromMap(Map<String, dynamic> map) {
    return SignatoryDetailsModel(
      name: map['name'],
      idProofNumber: map['idProofNumber'],
      mobileNumber: map['mobileNumber'],
      email: map['email'],
      selectedProof: map['selectedProof'],
      relationship: map['relationship'],
      // dob: map['dob'],
      gender: map['gender'],
      selectedParty: map['selectedParty'],
    );
  }
}
