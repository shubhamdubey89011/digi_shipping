// import 'package:document_fill_demo/party_details/controller/party_details_controller.dart';
// import 'package:document_fill_demo/party_details/view/reusable_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';



// class FirstPartyDetailsCard extends StatelessWidget {
//   final FirstPartyDetailsController controller = Get.put(FirstPartyDetailsController());

//   FirstPartyDetailsCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Container(
//         width: 327,height: 352,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: const Color.fromRGBO(141, 188, 211, 1)),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // First Form
//                 if (controller.isEditingFirstForm.value) ...[
//                   ReusableFormCard(
//                     title: 'First Party Details',
//                      proofs: [
//                   'ID Proof*',
//                   'Passport',
//                   'Driver License',
//                   'Aadhar Card'
//                 ], // Example proof types
//                     onContinue: () {
//                       controller.isEditingFirstForm.value = false;
//                     },
//                     nameController: TextEditingController(text: controller.firstFormFields['name']),
//                     idProofController: TextEditingController(text: controller.firstFormFields['idProof']),
//                     mobileNumberController: TextEditingController(),
//                     pinCodeController: TextEditingController(),
//                     selectedProof: ''.obs, // Example proof selection
//                     isFormValid: controller.isFirstFormValid,
//                     resetFields: () {
//                       controller.resetFields(true);
//                     },
//                     saveDetails: () {
//                       controller.firstFormFields['name'] = controller.firstFormFields['name'] ?? '';
//                       controller.firstFormFields['idProof'] = controller.firstFormFields['idProof'] ?? '';
//                     },
//                     validateForm: () {
//                       controller.validateFirstForm();
//                       return 'Form Validated'; // Placeholder for validation return
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: controller.isFirstFormValid.value
//                         ? () {
//                             controller.isEditingFirstForm.value = false;
//                           }
//                         : null,
//                     child: const Text("Continue"),
//                   ),
//                 ] else ...[
//                   // First Form Shrunk State
//                   Row(
//                     children: [
//                       SvgPicture.asset('assets/icons/tick_mark.svg', height: 16, width: 16),
//                       const SizedBox(width: 5),
//                       const Text("First Party Details", style: TextStyle(fontWeight: FontWeight.w600)),
//                       IconButton(
//                         icon: SvgPicture.asset('assets/icons/edit_icon.svg', height: 16, width: 15),
//                         onPressed: () {
//                           controller.isEditingFirstForm.value = true;
//                         },
//                       ),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       controller.isEditingSecondForm.value = true;
//                     },
//                     child: const Text(
//                       "Add Second Party Details",
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ],

//                 // Second Form
//                 if (controller.isEditingSecondForm.value) ...[
//                   ReusableFormCard(
//                     title: 'Second Party Details',
//                     proofs: ['Aadhar', 'Passport'], // Example proof types
//                     onContinue: () {
//                       controller.isEditingSecondForm.value = false;
//                     },
//                     nameController: TextEditingController(text: controller.secondFormFields['name']),
//                     idProofController: TextEditingController(text: controller.secondFormFields['idProof']),
//                     mobileNumberController: TextEditingController(),
//                     pinCodeController: TextEditingController(),
//                     selectedProof: ''.obs, // Example proof selection
//                     isFormValid: controller.isSecondFormValid,
//                     resetFields: () {
//                       controller.resetFields(false);
//                     },
//                     saveDetails: () {
//                       controller.secondFormFields['name'] = controller.secondFormFields['name'] ?? '';
//                       controller.secondFormFields['idProof'] = controller.secondFormFields['idProof'] ?? '';
//                     },
//                     validateForm: () {
//                       controller.validateSecondForm();
//                       return 'Form Validated'; // Placeholder for validation return
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: controller.isSecondFormValid.value
//                         ? () {
//                             controller.isEditingSecondForm.value = false;
//                           }
//                         : null,
//                     child: const Text("Continue"),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
