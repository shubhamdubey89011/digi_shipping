import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/dashboard/view/dashboard_view.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/party_details/controller/second_party_detailscontroller.dart';
import 'package:document_fill_demo/party_details/view/first_partydetails.dart';
import 'package:document_fill_demo/party_details/view/party_details.dart';
import 'package:document_fill_demo/party_details/view/second_partydetails.dart';
import 'package:document_fill_demo/signatory_details/controller/signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/view/first_signatory_details.dart';
import 'package:document_fill_demo/signatory_details/view/secod_signatory_details.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/view/document_details.dart';
import 'package:document_fill_demo/view/stamp_paper_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartySignatoryDetails extends StatelessWidget {
  
  PartySignatoryDetails({super.key});

// final SignatoryController controller = Get.find<SignatoryController>();
  final FirstPartyDetailsController firstcontroller =
      Get.find<FirstPartyDetailsController>();

      final SignatoryController signatorycontroller = Get.find<SignatoryController>();
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
        return DocumentDetailsPage();
      case 'PARTY':
        return PartyDetails();
      case 'STAMP':
        return StampPaperDetails();
      case 'SIGNATORY':
        return _partysignatorydetails();
      default:
        return _partysignatorydetails();
    }
  }

  Widget _partysignatorydetails() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 327,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(255, 254, 209, 1),
                ),
                child: customText(
                    text: 'Add at least two signatory .',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 12),
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

              SizedBox(
                height: 30,
              ),

              FirstSignatoryDetails(onContinue: () {
                signatorycontroller.toggleFormVisibility();
                
              },),
              SizedBox(
                height: 30,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
