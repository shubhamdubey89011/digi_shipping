// import 'package:document_fill_demo/utils/custom_textfield1.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class ReusableFormCard extends StatelessWidget {
//   final String title;
//   final List<String> proofs;
//   final VoidCallback onContinue;
//   final TextEditingController nameController;
//   final TextEditingController idProofController;
//   final TextEditingController mobileNumberController;
//   final TextEditingController pinCodeController;
//   final RxString selectedProof;
//   final RxBool isFormValid;
//   final VoidCallback resetFields;
//   final VoidCallback saveDetails;
//   final String Function() validateForm;

//   const ReusableFormCard({
//     Key? key,
//     required this.title,
//     required this.proofs,
//     required this.onContinue,
//     required this.nameController,
//     required this.idProofController,
//     required this.mobileNumberController,
//     required this.pinCodeController,
//     required this.selectedProof,
//     required this.isFormValid,
//     required this.resetFields,
//     required this.saveDetails,
//     required this.validateForm,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               color: Color.fromRGBO(78, 77, 77, 1),
//               fontSize: 14,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Obx(() {
//             return SingleChildScrollView(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize
//                     .min, // Ensures the column only takes up as much space as it needs
//                 children: [
//                   // Form section
//                   TextField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       labelText: 'Name *',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Obx(
//                           () => Container(
//                             height: 42,
//                             // padding: const EdgeInsets.symmetric(horizontal: 10),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: const Color.fromRGBO(141, 188, 211, 1),
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: DropdownButton<String>(
//                               value: selectedProof.value.isEmpty
//                                   ? proofs[0]
//                                   : selectedProof.value,
//                               items: proofs.map((proof) {
//                                 return DropdownMenuItem<String>(
//                                   value: proof,
//                                   child: Text(proof),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 if (value != null) {
//                                   selectedProof.value = value;
//                                 }
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         flex: 3,
//                         child: appTextField(context: context,onChanged: (value) {
                          
//                         },
//                           controller: idProofController,
                          
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: mobileNumberController,
//                     decoration: InputDecoration(
//                       labelText: 'Mobile Number *',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: pinCodeController,
//                     decoration: InputDecoration(
//                       labelText: 'Pin Code *',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                       height:
//                           10), // Replace Spacer() with SizedBox for better control
//                   ElevatedButton(
//                     onPressed: isFormValid.value
//                         ? () {
//                             saveDetails();
//                             onContinue();
//                           }
//                         : null,
//                     child: const Text('Continue'),
//                   ),
//                 ],
//               ),
//             );
//           }),
//           Obx(() {
//             return !isFormValid.value
//                 ? const SizedBox.shrink()
//                 : Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/icons/tick_mark.svg',
//                         height: 16,
//                         width: 16,
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         '$title Submitted',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(78, 77, 77, 1),
//                           fontSize: 14,
//                         ),
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         icon: SvgPicture.asset(
//                           'assets/icons/edit_icon.svg',
//                           height: 16,
//                           width: 16,
//                         ),
//                         onPressed: resetFields,
//                       ),
//                       IconButton(
//                         icon: SvgPicture.asset(
//                           'assets/icons/delete.svg',
//                           height: 16,
//                           width: 16,
//                         ),
//                         onPressed: resetFields,
//                       ),
//                     ],
//                   );
//           }),
//         ],
//       ),
//     );
//   }
// }
