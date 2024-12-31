// // import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class ToggleController extends GetxController {
//   // Reactive variables for toggles
//   var esignRequired = 0.obs; // 0: Yes, 1: No
//   var individualOrEntity = 0.obs; // 0: Individual, 1: Entity
//   var stampPaperNeeded = 0.obs; // 0: No, 1: Yes

//   void updateEsignRequired(int value) {
//     esignRequired.value = value;
//   }

//   void updateIndividualOrEntity(int value) {
//     individualOrEntity.value = value;
//   }

//   void updateStampPaperNeeded(int value) {
//     stampPaperNeeded.value = value;
//   }
// }

// class DocumentDetailsPage extends StatelessWidget {
//   DocumentDetailsPage({super.key});
//   final ToggleController toggleController = Get.put(ToggleController());

//   final List<Map<String, String>> tabsData = [
//     {'title': 'DOCUMENT', 'subtitle': 'DETAILS'},
//     {'title': 'ENTITY', 'subtitle': 'DETAILS'},
//     {'title': 'STAMP', 'subtitle': 'PAPER DETAILS'},
//     {'title': 'SIGNATORY', 'subtitle': 'DETAILS'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: DefaultTabController(
//         length: tabsData.length,
//         child: Scaffold(
//           backgroundColor: const Color.fromRGBO(240, 238, 255, 1),
//           appBar: customAppBar(
//             elevation: 0,
//             title: 'Digital',
//             subtitle: 'Signature',
//             centerTitle: false,
//             bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(140),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 20),
//                     width: 166,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(27),
//                       border: Border.all(
//                         color: Color.fromRGBO(78, 77, 77, 1),
//                       ),
//                     ),
//                     child: TextButton(
//                       onPressed: () {
//                         Get.to(() => Instructions());
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           customText(
//                             text: 'Simple Instructions',
//                             color: Colors.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           SizedBox(width: 8), // Add spacing between text and icon
//                           SvgPicture.asset(
//                             'assets/icons/arrow.svg',
//                             color: Colors.black,
//                             height: 16, // Adjust size as needed
//                             width: 16,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 45,
//                   ),
//                   TabBar(
//                     indicatorColor: Colors.blue,
//                     labelColor: Colors.blue,
//                     unselectedLabelColor: Colors.grey,
//                     tabs: tabsData
//                         .map(
//                           (tab) => Tab(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 customText(
//                                     text: tab['title']!,
//                                     color: Colors.black,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w700),
//                                 customText(
//                                     text: tab['subtitle']!,
//                                     color: Colors.black,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w700),
//                               ],
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           body: TabBarView(
//             children: tabsData.map((tab) => _buildTabContent(tab['title']!)).toList(),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTabContent(String title) {
//     switch (title) {
//       case 'DOCUMENT':
//         return _buildDocumentDetails();
//       case 'ENTITY':
//         return EntityDetails();
//       case 'STAMP':
//         return StampPaperDetails();
//       case 'SIGNATORY':
//         return Center(
//           child: customText(
//             text: 'Signatory Details Page',
//             color: Colors.black,
//             fontSize: 10,
//             fontWeight: FontWeight.w700,
//           ),
//         );
//       default:
//         return Center(
//           child: customText(
//             text: 'Other Details Page',
//             color: Colors.black,
//             fontSize: 10,
//             fontWeight: FontWeight.w700,
//           ),
//         );
//     }
//   }

//   Widget _buildDocumentDetails() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(10)),
//             padding: EdgeInsets.all(24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 customText(
//                     text: 'Upload your Agreement to Proceed *',
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600),
//                 const SizedBox(height: 16),
//                 DashedBorderContainer(
//                   dashWidth: 8.0,
//                   dashSpace: 4.0,
//                   strokeWidth: 1.0,
//                   borderColor: Color.fromRGBO(141, 188, 211, 1),
//                   borderRadius: 7.0,
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 50,
//                     width: 294,
//                     child: customText(
//                         text: 'PDF12.pdf',
//                         color: Color.fromRGBO(19, 110, 248, 1),
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 customText(
//                   text: 'Please upload a PDF file between 50 KB and 1024 KB.',
//                   color: Color.fromRGBO(73, 69, 79, 1),
//                   fontSize: 8,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             margin: EdgeInsets.all(10),
//             child: Material(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 elevation: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     children: [
//                       _buildToggleSection(
//                         title: 'E-Sign Required or Not*',
//                         toggleButtons: [
//                           Obx(() => buildToggleGroup(
//                             labels: ['Yes', 'No'],
                            // selectedValue: toggleController.esignRequired.value,
                            // onValueChanged: (index) {
                            //   toggleController.updateEsignRequired(index);
                            // },
//                           )),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _buildToggleSection(
//                             title: 'Individual or Entity*',
//                             toggleButtons: [
//                               Obx(() => buildToggleGroup(
//                                 labels: ['Individual', 'Entity'],
//                                 selectedValue: toggleController.individualOrEntity.value,
//                                 onValueChanged: (index) {
//                                   toggleController.updateIndividualOrEntity(index);
//                                 },
//                               )),
//                             ],
//                           ),
//                           SizedBox(width: 8),
//                           _buildToggleSection(
//                             title: 'Stamp Paper Needed?',
//                             toggleButtons: [
//                               Obx(() => buildToggleGroup(
//                                 labels: ['Yes', 'No'],
//                                 selectedValue: toggleController.stampPaperNeeded.value,
//                                 onValueChanged: (index) {
//                                   toggleController.updateStampPaperNeeded(index);
//                                 },
//                               )),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )),
//           ),
//         ],
//       ),
//     );
//   }

  // Widget _buildToggleSection({
  //   required String title,
  //   required List<Widget> toggleButtons,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       customText(
  //         text: title,
  //         color: Colors.black,
  //         fontSize: 12,
  //         fontWeight: FontWeight.w600,
  //       ),
  //       const SizedBox(height: 12),
  //       ...toggleButtons,
  //     ],
  //   );
  // }

//   Widget buildToggleGroup({
//     required List<String> labels,
//     required int selectedValue,
//     required Function(int) onValueChanged,
//   }) {
//     return ToggleButtons(
//       isSelected: List.generate(labels.length, (index) => selectedValue == index),
//       onPressed: (index) {
//         onValueChanged(index);
//       },
//       children: labels.map((label) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Text(label),
//       )).toList(),
//     );
//   }
// }
