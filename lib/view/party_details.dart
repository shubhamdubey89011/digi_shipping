import 'package:document_fill_demo/utils/custom_appbar.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartyDetails extends StatelessWidget {
  PartyDetails({super.key});

  final RxString selectedID = ''.obs;

  final List<String> proofs = [
    'Select ID Proof',
    'Aadhar Card',
    'Voter ID Card',
    'PAN Card',
    'Passport'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 238, 255, 1),
        appBar: customAppBar(
          // backgroundColor: Colors.transparent,
          elevation: 0,
          title: 'Digital',
          subtitle: 'Signature',
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        // Simple Instructions action
                      },
                      child: Row(
                        children: [
                          const Text('Simple Instructions'),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                  const TabBar(
                    tabs: [
                      Tab(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'DOCUMENT',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            if ('DETAILS' != null)
                              Text(
                                'DETAILS',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                        // Text('DOCUMENT DETAILS'),
                      ),
                      Tab(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'PARTY',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            if ('DETAILS' != null)
                              Text(
                                'DETAILS',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                        // Text(' DETAILS'),
                      ),
                      Tab(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'STAMP',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            if ('DETAILS' != null)
                              Text(
                                'DETAILS',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'SIGNATORY',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            if ('DETAILS' != null)
                              Text(
                                'DETAILS',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            text: 'Add First Party Details',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                            type: MaterialType.card,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color.fromRGBO(141, 188, 211, 1),
                                )),
                            child: customTextField(labelText: 'Name *')),
                        SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                            height: 8), // Space between label and dropdown
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Dropdown
                            Expanded(
                              flex:
                                  2, // Adjust the flex to control the space ratio
                              child: Obx(
                                () => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(
                                          141, 188, 211, 1), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                  ),
                                  child: DropdownButton<String>(
                                    focusColor: Colors.transparent,
                                    isExpanded: true,
                                    underline:
                                        const SizedBox(), // Removes default underline
                                    value: selectedID.value.isEmpty
                                        ? proofs[0]
                                        : selectedID.value,
                                    items: proofs
                                        .map(
                                          (proof) => DropdownMenuItem<String>(
                                            value: proof,
                                            child: Text(proof),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        selectedID.value = value;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    10), // Space between dropdown and text field

                            // TextField
                            Expanded(
                              flex:
                                  3, // Adjust the flex to control the space ratio
                              child: Material(
                                type: MaterialType.card,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: Color.fromRGBO(141, 188, 211, 1),
                                  ),
                                ),
                                child: customTextField(
                                    labelText: 'ID Proof Number *'),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Material(
                            type: MaterialType.card,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color.fromRGBO(141, 188, 211, 1),
                                )),
                            child:
                                customTextField(labelText: 'Mobile Number *')),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                            type: MaterialType.card,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color.fromRGBO(141, 188, 211, 1),
                                )),
                            child: customTextField(labelText: 'Pin Code *')),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                            type: MaterialType.card,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color.fromRGBO(141, 188, 211, 1),
                                )),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor: WidgetStatePropertyAll(
                                        const Color.fromRGBO(55, 0, 179, 1))),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(width: double.infinity,
                  child: Material(
                    type: MaterialType.card,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Color.fromRGBO(141, 188, 211, 1),
                        )),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Second Party Details',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
