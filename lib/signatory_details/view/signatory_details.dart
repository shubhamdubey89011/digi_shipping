import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/party_details/view/first_partydetails.dart';
import 'package:document_fill_demo/party_details/view/party_details.dart';
import 'package:document_fill_demo/party_details/view/second_partydetails.dart';
import 'package:document_fill_demo/signatory_details/controller/second_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/controller/signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/view/first_signatory_details.dart';
import 'package:document_fill_demo/signatory_details/view/secod_signatory_details.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:document_fill_demo/view/document_details.dart';
import 'package:document_fill_demo/view/stamp_paper_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartySignatoryDetails extends StatelessWidget {
  PartySignatoryDetails({super.key});

// final SignatoryController controller = Get.find<SignatoryController>();
  final PartyDetailsController firstcontroller =
      Get.find<PartyDetailsController>();

  final SignatoryController signatorycontroller =
      Get.find<SignatoryController>();
      final SecondSignatoryController secondSignatoryController = Get.find<SecondSignatoryController>();
  // final SecondPartyDetailscontroller secondcontroller =
  //     Get.find<SecondPartyDetailscontroller>();

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
      backgroundColor: ColorConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RmiWidgetHelper.rmiContainer(
                color: ColorConstants.backgroundYellow,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RmiWidgetHelper.rmiText(
                      text: AppStrings.firstAndSecondText,
                    ),
                    RmiWidgetHelper.rmiText(
                      text: AppStrings.theseDetailsText,
                    ),
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
                  firstcontroller.toggleFormVisibility();

                  print('Continue pressed');
                },
              ),
              SizedBox(
                height: 30,
              ),
              FirstSignatoryDetails(
                onContinue: () {
                  signatorycontroller.toggleFormVisibility();
                },
              ),
              SizedBox(
                height: 30,
              ),
              SecondSignatoryDetails(
                onContinue: () {
                  signatorycontroller.checkTableAndToggleForm();

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
