import 'package:document_fill_demo/party_details/view/second_partydetails.dart';
import 'package:document_fill_demo/party_details/view/first_partydetails.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/view/stamp_paper_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartyDetails extends StatefulWidget {
  PartyDetails({super.key});

  @override
  _PartyDetailsState createState() => _PartyDetailsState();
}

class _PartyDetailsState extends State<PartyDetails> {
  final RxString selectedID = ''.obs;

  final List<String> proofs = [
    'ID Proof *',
    'Aadhar Card',
    'Voter ID Card',
    'PAN Card',
    'Passport'
  ];

  final List<Map<String, String>> tabsData = [
    {'title': 'DOCUMENT', 'subtitle': 'DETAILS'},
    {'title': 'PARTY', 'subtitle': 'DETAILS'},
    {'title': 'STAMP', 'subtitle': 'PAPER DETAILS'},
    {'title': 'SIGNATORY', 'subtitle': 'DETAILS'},
  ];

  // A flag to manage the expanded state of the first party details container
  bool isSecondPartyVisible = false;

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
                        text: 'These details will be printed on the stamp paper',
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
                proofs: ['ID Proof*', 'Passport', 'Driver License', 'Aadhar Card'],
                onContinue: () {
                  print('Continue pressed');
                },
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 30),
                height: isSecondPartyVisible ? 200 : 53, // Adjust height based on state
                width: 327,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(141, 188, 211, 1),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(alignment: Alignment.centerLeft),
                  onPressed: () {
                    setState(() {
                      isSecondPartyVisible = !isSecondPartyVisible; // Toggle visibility
                    });
                  },
                  child: customText(
                    text: isSecondPartyVisible ? 'Hide Second Party Details' : 'Second Party Details',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (isSecondPartyVisible)
                SecondPartyDetailsCard(proofs: [],
                  onContinue: () {
                  
                },), // Display second party details form

            ],
          ),
        ),
      ),
    );
  }
}
