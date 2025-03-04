import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/constants/dimensions.dart';
import 'package:document_fill_demo/dashboard/view/dashboard_view.dart';
import 'package:document_fill_demo/party_details/controller/first_party_details_controller.dart';
import 'package:document_fill_demo/party_details/view/first_partydetails.dart';
import 'package:document_fill_demo/party_details/view/party_details.dart';
import 'package:document_fill_demo/party_details/view/second_partydetails.dart';
import 'package:document_fill_demo/signatory_details/second_signatory/controller/second_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/first_signatory_details/controller/first_signatory_controller.dart';
import 'package:document_fill_demo/signatory_details/first_signatory_details/view/first_signatory_details.dart';
import 'package:document_fill_demo/signatory_details/second_signatory/view/secod_signatory_details.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:document_fill_demo/other_views/document_details.dart';
import 'package:document_fill_demo/other_views/stamp_paper_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class PartySignatoryDetails extends StatelessWidget {
  PartySignatoryDetails({super.key});

  final PartyDetailsController firstcontroller =
      Get.find<PartyDetailsController>();

  final FirstSignatoryController signatorycontroller =
      Get.find<FirstSignatoryController>();
  final SecondSignatoryController secondSignatoryController =
      Get.find<SecondSignatoryController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 238, 255, 1),
        body: TabBarView(
          children: tabsData
              .map((tab) => _buildTabContent(tab['title']!, context))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTabContent(String title, context) {
    switch (title) {
      case 'DOCUMENT':
        return DocumentDetailsPage();
      case 'PARTY':
        return PartyDetails();
      case 'STAMP':
        return StampPaperDetails();
      case 'SIGNATORY':
        return _partysignatorydetails(context);
      default:
        return _partysignatorydetails(context);
    }
  }

  Widget _partysignatorydetails(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
              SizedBox(height: 20),
              FirstPartyDetailsCard(
                onContinue: () {
                  firstcontroller.toggleFormVisibility();
                  print('Continue pressed');
                },
              ),
              SizedBox(height: 30),
              SecondPartyDetailsCard(
                onContinue: () {
                  firstcontroller.toggleFormVisibility();
                  print('Continue pressed');
                },
              ),
              SizedBox(height: 30),
              FirstSignatoryDetails(
                onContinue: () {
                  signatorycontroller.toggleFormVisibility();
                },
              ),
              SizedBox(height: 20),
              SecondSignatoryDetails(
                onContinue: secondSignatoryController.checkTableAndToggleForm,
              ),
              SizedBox(height: 20),
              Obx(() {
                bool isFirstSignatoryCompleted =
                    !signatorycontroller.formVisible.value;
                bool isAtLeastOneSecondSignatoryCompleted =
                    secondSignatoryController.instances
                        .any((instance) => instance.formVisible.value == false);

                bool isContinueEnabled = isFirstSignatoryCompleted &&
                    isAtLeastOneSecondSignatoryCompleted;

                return ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(double.infinity,
                        SizeConfig.screenHeight(context) / 20)),
                    elevation: WidgetStatePropertyAll(0),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return const Color.fromARGB(55, 78, 77, 77);
                        }
                        return ColorConstants.buttonColor;
                      },
                    ),
                  ),
                  onPressed: isContinueEnabled
                      ? () {
                          print("Proceed button pressed");
                          Get.to(() => DashboardView());
                        }
                      : null,
                  child: RmiWidgetHelper.rmiText(
                    text: 'Continue',
                    color: ColorConstants.backgroundWhite,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
