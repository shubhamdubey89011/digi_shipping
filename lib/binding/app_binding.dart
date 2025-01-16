import 'package:document_fill_demo/dashboard/controller/dashboard_controller.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/party_details/controller/second_party_detailscontroller.dart';
import 'package:document_fill_demo/signatory_details/controller/second_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/controller/signatory_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FirstPartyDetailsController(), fenix: true);
    Get.lazyPut(() => SecondPartyDetailscontroller(), fenix: true);
    Get.lazyPut(() => SignatoryController(), fenix: true);
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => SecondSignatoryController(), fenix: true);
    // Get.lazyPut(() => PartyController(), fenix: true);
  }

}