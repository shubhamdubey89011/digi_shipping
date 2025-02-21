  import 'package:hive/hive.dart';

final List<String> proofs = [
    'Aadhaar Card',
    'Voter ID Card',
    'PAN Card',
    'Passport'
  ];
  final List<String> party = [
    
    'First Party',
    'Second Party',
    'Third Party',
    
  ];

  final List<Map<String, String>> tabsData = [
    {'title': 'DOCUMENT', 'subtitle': 'DETAILS'},
    {'title': 'PARTY', 'subtitle': 'DETAILS'},
    {'title': 'STAMP', 'subtitle': 'PAPER DETAILS'},
    {'title': 'SIGNATORY', 'subtitle': 'DETAILS'},
  ];


  class DbHelperKeys {
  static const firstSignatoryDetailsColumn  = 'firstpartydetails';
  static const secondSignatoryDetailsColumn = 'secondpartydetails';
  static const signatoryDetailsColumn = 'signatorydetails';
  static const secondsignatoryDetailsColumn = 'secondsignatorydetails';
  static const firstpartydatabase = 'firstpartydatabase';
 
}


class AppStrings {
   static const secondPartyDetails =  'Second Party Details';
   static const firstPartyDetails = 'First Party Details';
   static const firstSignatoryDetails = 'First Signatory Details';
   static const secondSignatoryDetails = 'Second Signatory Details';
   static const addSecondPartyDetails = 'Add Second Party Details';
   static const addFirstPartyDetails = 'Add First Party Details';
   static const continueButton = 'Continue';
   static const pinCode = 'Pin Code *';
   static const mobNumber = 'Mobile Number *';
   static const name = 'Name *';
   static const email = 'Email *';
   static const edit = 'Edit';
   static const male = 'Male';
   static const relationshipType = 'Relationship of the Party *';
   static const firstAndSecondText = 'First and Second Party details are mandatory.';
   static const theseDetailsText = 'These details will be printed on the stamp paper';
}



  late Box partyhive;
  late Box signatoryhive;