import 'package:hive/hive.dart';
part 'party_model.g.dart';

@HiveType(typeId: 0)
class PartyModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int? idProofNumber;

  @HiveField(2)
  int mobileNumber;

  @HiveField(3)
  int? pinCode;

  @HiveField(4)
  String? selectedProof;

  PartyModel({required this.name,
     this.idProofNumber,
    required this.mobileNumber,
     this.pinCode,
     this.selectedProof,});
}
