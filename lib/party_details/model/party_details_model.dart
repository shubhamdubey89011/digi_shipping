

class PartyDetails {
  String name;
  int idProofNumber;
  int mobileNumber;
  int pinCode;
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

  factory PartyDetails.fromMap(Map<String, dynamic> map) {
    return PartyDetails(
      name: map['name'],
      idProofNumber: map['idProofNumber'],
      mobileNumber: map['mobileNumber'],
      pinCode: map['pinCode'],
      selectedProof: map['selectedProof'],
    );
  }
}
