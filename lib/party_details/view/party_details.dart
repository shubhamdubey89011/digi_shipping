import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/dashboard/view/dashboard_view.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/party_details/controller/second_party_detailscontroller.dart';
import 'package:document_fill_demo/party_details/view/second_partydetails.dart';
import 'package:document_fill_demo/party_details/view/first_partydetails.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/view/stamp_paper_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartyDetails extends StatelessWidget {
  PartyDetails({super.key});

  // final FirstPartyDetailsController controller =
  //     Get.put(FirstPartyDetailsController());

  final FirstPartyDetailsController firstcontroller = Get.find<FirstPartyDetailsController>();
  final SecondPartyDetailscontroller secondcontroller = Get.find<SecondPartyDetailscontroller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 238, 255, 1),
        body: TabBarView(
          children:
              tabsData.map((tab) => _buildTabContent(tab['title']!)).toList(),
        ),
      ),
    );
  }

  Widget _buildTabContent(String title) {
    switch (title) {
      case 'DOCUMENT':
        return _partyDocumentDetails();
      case 'PARTY':
        return _partyDocumentDetails();
      case 'STAMP':
        return StampPaperDetails();
      case 'SIGNATORY':
        return Center(
            child: customText(
                text: 'Signatory Details Page',
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w700));
      default:
        return Center(
            child: customText(
                text: 'Other Details Page',
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w700));
    }
  }

  Widget _partyDocumentDetails() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 327,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(255, 254, 209, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                        text: 'First and Second Party details are mandatory.',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 12),
                    customText(
                        text:
                            'These details will be printed on the stamp paper',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 12),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FirstPartyDetailsCard(
                onContinue: () {
                  firstcontroller.toggleFormVisibility();

                  print('Continue pressed');
                },
              ),
              SizedBox(
                height: 30,
              ),
              SecondPartyDetailsCard(
                onContinue: () {
                  secondcontroller.toggleFormVisibility();
                  

                  print('Continue pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
