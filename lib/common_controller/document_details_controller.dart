import 'package:get/get.dart';

class DocumentDetailsController extends GetxController {

  final esignRequired = 0.obs; // 0: Yes, 1: No
  final individualOrEntity = 0.obs; // 0: Individual, 1: Entity
  final stampPaperNeeded = 0.obs; // 0: No, 1: Yes
  final selectedState = ''.obs;
var fileName = Rx<String?>(null);

     final List<String> states = [
    'Select State',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];
}