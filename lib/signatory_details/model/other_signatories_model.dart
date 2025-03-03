class OtherSignatoriesModel {
  String id; // Add this field
  String name;
  String idProofNumber;
  int mobileNumber;
  String email;
  String selectedProof;
  String relationship;
  String dob;
  String gender;
  String selectedParty;
  bool formVisible;

  OtherSignatoriesModel({
    required this.id, // Add this field
    required this.name,
    required this.idProofNumber,
    required this.mobileNumber,
    required this.email,
    required this.selectedProof,
    required this.relationship,
    required this.dob,
    required this.gender,
    required this.selectedParty,
    this.formVisible = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include the ID in the map
      'name': name,
      'idProofNumber': idProofNumber,
      'mobileNumber': mobileNumber,
      'email': email,
      'selectedProof': selectedProof,
      'relationship': relationship,
      'dob': dob,
      'gender': gender,
      'selectedParty': selectedParty, 'formVisible': formVisible ? 1 : 0,
    };
  }

  factory OtherSignatoriesModel.fromMap(Map<String, dynamic> map) {
    return OtherSignatoriesModel(
      id: map['id'], // Include the ID in the factory method
      name: map['name'],
      idProofNumber: map['idProofNumber'],
      mobileNumber: map['mobileNumber'],
      email: map['email'],
      selectedProof: map['selectedProof'],
      relationship: map['relationship'],
      dob: map['dob'],
      gender: map['gender'],
      selectedParty: map['selectedParty'], formVisible: map['formVisible'] == 1,
    );
  }
}
