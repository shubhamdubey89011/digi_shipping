import 'package:document_fill_demo/controller/document_details_controller.dart';
import 'package:document_fill_demo/controller/toggle_controller.dart';
import 'package:document_fill_demo/party_details/view/party_details.dart';
import 'package:document_fill_demo/utils/custom_appbar.dart';
import 'package:document_fill_demo/utils/custom_dash_container.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/utils/custom_toggle.dart';
import 'package:document_fill_demo/view/instructions.dart';
import 'package:document_fill_demo/view/stamp_paper_details.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ToggleController extends GetxController {
  var selectedValue = 0.obs; // Observable integer for toggle options
  var entityType = 0.obs; // Observable integer for entity type toggle

  void updateSelectedValue(int value) {
    selectedValue.value = value;
  }

  void updateEntityType(int value) {
    entityType.value = value;
  }
}

class DocumentDetailsPage extends StatelessWidget {
  DocumentDetailsPage({super.key});
  final ToggleController toggleController = Get.put(ToggleController());
  final DocumentDetailsController _controller =
      Get.put(DocumentDetailsController());

  final CustomToggleController esignRequiredController =
      Get.put(CustomToggleController(), tag: 'esign');
  final CustomToggleController individualOrEntityController =
      Get.put(CustomToggleController(), tag: 'entity');
  final CustomToggleController stampPaperNeededController =
      Get.put(CustomToggleController(), tag: 'stamp');

  final RxInt esignRequired = 0.obs;
  final RxInt individualOrEntity = 0.obs;
  final RxInt stampPaperNeeded = 0.obs;

  final List<Map<String, String>> tabsData = [
    {'title': 'DOCUMENT', 'subtitle': 'DETAILS'},
    {'title': 'PARTY', 'subtitle': 'DETAILS'},
    {'title': 'STAMP', 'subtitle': 'PAPER DETAILS'},
    {'title': 'SIGNATORY', 'subtitle': 'DETAILS'},
  ];

  final selectedState = ''.obs;

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: tabsData.length,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(240, 238, 255, 1),
          appBar: customAppBar(
            elevation: 0,
            title: 'Digital',
            subtitle: 'Signature',
            centerTitle: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: 166,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(
                        color: Color.fromRGBO(78, 77, 77, 1),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => Instructions());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          customText(
                            text: 'Simple Instructions',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                              width: 8), // Add spacing between text and icon
                          SvgPicture.asset(
                            'assets/icons/arrow.svg',
                            color: Colors.black,
                            height: 16, // Adjust size as needed
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  TabBar(
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: tabsData
                        .map(
                          (tab) => Tab(
                            // height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customText(
                                    text: tab['title']!,
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700),
                                customText(
                                    text: tab['subtitle']!,
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children:
                tabsData.map((tab) => _buildTabContent(tab['title']!)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String title) {
    switch (title) {
      case 'DOCUMENT':
        return _buildDocumentDetails();
      case 'PARTY':
        return PartyDetails();
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

  Widget _buildDocumentDetails() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: 'Upload your Agreement to Proceed *',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    // Request file picker to select a PDF file
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'], // Restrict to PDF files only
                    );

                    if (result != null) {
                      // File selected
                      PlatformFile file = result.files.first;

                      // Check file size (between 50 KB and 1024 KB)
                      if (file.size >= 50 * 1024 && file.size <= 1024 * 1024) {
                        _controller.fileName.value =
                            file.name; // Update file name
                        print('Selected file: ${file.name}');
                      } else {
                        print('File size is out of the allowed range.');
                        // Show an error message if needed
                      }
                    } else {
                      print('File selection cancelled.');
                    }
                  },
                  child: DashedBorderContainer(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 294,
                      child: Obx(() {
                        // Use Obx to reactively display the file name
                        return customText(
                          text:
                              _controller.fileName.value ?? 'Tap to upload PDF',
                          color: Color.fromRGBO(19, 110, 248, 1),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                customText(
                  text: 'Please upload a PDF file between 50 KB and 1024 KB.',
                  color: Color.fromRGBO(73, 69, 79, 1),
                  fontSize: 8,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildToggleSection(
                      controller: esignRequiredController,
                      labels: ['Yes', 'No'],
                      onValueChanged: (index) {
                        esignRequired.value = index;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildToggleSection(
                          controller: individualOrEntityController,
                          labels: ['Individual', 'Entity'],
                          onValueChanged: (index) {
                            individualOrEntity.value = index;
                          },
                        ),
                        const SizedBox(width: 20),
                        _buildToggleSection(
                          controller: stampPaperNeededController,
                          labels: ['Yes', 'No'],
                          onValueChanged: (index) {
                            stampPaperNeeded.value = index;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Color.fromRGBO(141, 188, 211, 1), width: 1)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: DropdownButton<String>(
                  isDense: true,
                  borderRadius: BorderRadius.circular(10),
                  isExpanded: true,
                  underline: SizedBox.shrink(), // Removes the underline
                  value: selectedState.value.isEmpty
                      ? states[0]
                      : selectedState.value,
                  items: states
                      .map((state) => DropdownMenuItem<String>(
                          value: state,
                          child: customText(
                              text: state,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedState.value = value;
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
                color: Color.fromRGBO(55, 0, 179, 1),
                borderRadius: BorderRadius.circular(10)),
            child: ElevatedButton(
              style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(
                    Size.fromWidth(double.infinity),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                // Get.to(() => EntityDetails());
              },
              child: customText(
                  text: 'Continue',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSection({
    // required String title,
    required CustomToggleController controller,
    required List<String> labels,
    required ValueChanged<int> onValueChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 244, 245, 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: CustomToggleButtons(
        labels: labels,
        controller: controller,
        onValueChanged: onValueChanged,
      ),
    );
  }
}
