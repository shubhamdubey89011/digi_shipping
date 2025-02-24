import 'package:document_fill_demo/dashboard/controller/dashboard_controller.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';

import 'package:document_fill_demo/signatory_details/second_signatory/controller/second_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/first_signatory_details/controller/first_signatory_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PartyDetailsController(), fenix: true);
    Get.lazyPut(() => FirstSignatoryController(), fenix: true);
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => SecondSignatoryController(), fenix: true);
  }
}
