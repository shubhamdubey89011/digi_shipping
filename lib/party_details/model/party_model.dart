import 'package:hive/hive.dart';
part 'party_model.g.dart';

@HiveType(typeId: 0)
class PartyModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int idProofNumber;

  @HiveField(2)
  int mobileNumber;

  @HiveField(3)
  int pinCode;

  @HiveField(4)
  String selectedProof;

  @HiveField(5) // New field
  String? formType; // Indicates which form this data belongs to ('form1' or 'form2')

  PartyModel({
    required this.name,
   required this.idProofNumber,
    required this.mobileNumber,
   required this.pinCode,
   required this.selectedProof,
     this.formType,
  });

  @override
  String toString() {
    return 'PartyModel(name: $name, idProofNumber: $idProofNumber, mobileNumber: $mobileNumber, pinCode: $pinCode, selectedProof: $selectedProof)';
  }
}
