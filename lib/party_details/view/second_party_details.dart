// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SecondPartyDetailsCard extends StatelessWidget {
//   final List<String> proofs;
//   final VoidCallback onContinue;

//   SecondPartyDetailsCard({required this.proofs, required this.onContinue});

//   final RxString name = ''.obs;
//   final RxString idProofNumber = ''.obs;
//   final RxString mobileNumber = ''.obs;
//   final RxString pinCode = ''.obs;
//   final RxString selectedProof = ''.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
       
//         TextField(
//           decoration: InputDecoration(labelText: 'Name'),
//           onChanged: (value) {
//             name.value = value;
//           },
//         ),
//         TextField(
//           decoration: InputDecoration(labelText: 'ID Proof Number'),
//           onChanged: (value) {
//             idProofNumber.value = value;
//           },
//         ),
//         TextField(
//           decoration: InputDecoration(labelText: 'Mobile Number'),
//           onChanged: (value) {
//             mobileNumber.value = value;
//           },
//         ),
//         TextField(
//           decoration: InputDecoration(labelText: 'Pin Code'),
//           onChanged: (value) {
//             pinCode.value = value;
//           },
//         ),
//         DropdownButton<String>(
//           value: selectedProof.value.isEmpty ? null : selectedProof.value,
//           hint: Text('Select ID Proof'),
//           onChanged: (newValue) {
//             selectedProof.value = newValue!;
//           },
//           items: proofs.map((String proof) {
//             return DropdownMenuItem<String>(
//               value: proof,
//               child: Text(proof),
//             );
//           }).toList(),
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: onContinue,
//           child: Text('Continue'),
//         ),
//       ],
//     );
//   }
// }


// // Widget _infoBanner() {
// //     return Container(
// //       height: 60,
// //       width: double.infinity,
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(10),
// //         color: const Color.fromRGBO(255, 254, 209, 1),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           customText(
// //             text: 'First and Second Party details are mandatory.',
// //             fontWeight: FontWeight.w600,
// //             color: Colors.black,
// //             fontSize: 12,
// //           ),
// //           customText(
// //             text: 'These details will be printed on the stamp paper',
// //             fontWeight: FontWeight.w600,
// //             color: Colors.black,
// //             fontSize: 12,
// //           ),
// //         ],
// //       ),
// //     );
// //   }