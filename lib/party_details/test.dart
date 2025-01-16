// import 'dart:math';

// import 'package:document_fill_demo/party_details/model/party_model.dart';
// import 'package:document_fill_demo/party_details/services/boxes.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final nameController = TextEditingController();
//   final idProofNumberController = TextEditingController();
//   final mobileNumberController = TextEditingController();
//   final pincodeController = TextEditingController();
//   final selectedProofController = TextEditingController();

//   // List<Color> colors = [
//   //   Colors.purple,
//   //   Colors.black38,
//   //   Colors.green,
//   //   Colors.blue,
//   //   Colors.red
//   // ];

//   // Random random = Random(3);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hive Database'),
//       ),
//       body: ValueListenableBuilder<Box<PartyModel>>(
//         valueListenable: Boxes.getData().listenable(),
//         builder: (context, box, _) {
//           var data = box.values.toList().cast<PartyModel>();
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: ListView.builder(
//                 itemCount: box.length,
//                 reverse: true,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: Card(
                      
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   data[index].name.toString(),
//                                   style: const TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white),
//                                 ),
//                                 const Spacer(),
//                                 InkWell(
//                                     onTap: () {
//                                       delete(data[index]);
//                                     },
//                                     child: const Icon(
//                                       Icons.delete,
//                                       color: Colors.white,
//                                     )),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 InkWell(
//                                     onTap: () {
//                                       _editDialog(
//                                           data[index],
//                                           data[index].name.toString(),
//                                           data[index].mobileNumber.toString());
//                                     },
//                                     child: const Icon(
//                                       Icons.edit,
//                                       color: Colors.white,
//                                     )),
//                               ],
//                             ),
//                             Text(
//                               data[index].mobileNumber.toString(),
//                               style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w300,
//                                   color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           _showMyDialog();
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void delete(PartyModel PartyModel) async {
//     await PartyModel.delete();
//   }

//   Future<void> _editDialog(
//       PartyModel PartyModel, String title, String description) async {
//     nameController.text = title;
//     mobileNumberController.text = description;

//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('Edit NOTES'),
//             content: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                         hintText: 'Enter title', border: OutlineInputBorder()),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: mobileNumberController,
//                     decoration: const InputDecoration(
//                         hintText: 'Enter Mobile Number',
//                         border: OutlineInputBorder()),
//                   )
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Cancel')),
//               TextButton(
//                   onPressed: () async {
//                     PartyModel.name = nameController.text.toString();
//                     PartyModel.mobileNumber =
//                         int.parse(mobileNumberController.text);

//                     PartyModel.save();
//                     mobileNumberController.clear();
//                     nameController.clear();

//                     // box.

//                     Navigator.pop(context);
//                   },
//                   child: const Text('Edit')),
//             ],
//           );
//         });
//   }

//   Future<void> _showMyDialog() async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('Add NOTES'),
//             content: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                         hintText: 'Enter title', border: OutlineInputBorder()),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: mobileNumberController,
//                     decoration: const InputDecoration(
//                         hintText: 'Enter mobile number',
//                         border: OutlineInputBorder()),
//                   )
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Cancel')),
//               TextButton(
//                   onPressed: () {
//                     final data = PartyModel(
//                       name: nameController.text,
//                       // idProofNumber: int.parse(idProofNumberController.text),
//                       mobileNumber: int.parse(mobileNumberController.text),
//                       // pinCode: int.parse(pincodeController.text),
//                       // selectedProof: selectedProofController.text,
//                         );

//                     final box = Boxes.getData();
//                     box.add(data);

//                     // data.save() ;

//                     nameController.clear();
//                     mobileNumberController.clear();
//                     // idProofNumberController.clear();
//                     // pincodeController.clear();
//                     // selectedProofController.clear();

//                     // box.

//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add')),
//             ],
//           );
//         });
//   }
// }
