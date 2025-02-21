import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/party_details/view/second_partydetails.dart';
import 'package:document_fill_demo/party_details/view/first_partydetails.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:document_fill_demo/view/stamp_paper_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartyDetails extends StatelessWidget {
  PartyDetails({super.key});

  final PartyDetailsController firstcontroller =
      Get.find<PartyDetailsController>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
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
      default:
        return Center();
    }
  }

  Widget _partyDocumentDetails() {
    // secondcontroller.formVisible.value = true;
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
                  print('First Party details submitted');
                },
              ),
              SizedBox(
                height: 30,
              ),
              SecondPartyDetailsCard(
                onContinue: () {
                  firstcontroller.checkTableAndToggleForm();

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
