// import 'package:document_fill_demo/controller/tab_controller.dart';
// import 'package:document_fill_demo/test2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TabbedFormsScreen extends StatelessWidget {
//   const TabbedFormsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(TabControllerClass()); // Initialize GetX controller

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tabbed Forms with GetX'),
//         bottom: TabBar(
//           controller: controller.tabController,
//           tabs: const [
//             Tab(text: 'Form 1'),
//             Tab(text: 'Form 2'),
//             Tab(text: 'Form 3'),
//             Tab(text: 'Form 4'),
//           ],
//         ),
//       ),
//       body: Obx(() {
//         return TabBarView(
//           controller: controller.tabController,
//           children: List.generate(4, (index) {
//             return Stack(
//               children: [
//                 FormPage(index: index), // Pass the index to each form page
//                 Positioned(
//                   bottom: 16,
//                   right: 16,
//                   child: ElevatedButton(
//                     onPressed: controller.currentTab.value == index
//                         ? () => controller.onContinuePressed(index)
//                         : null, // Enable button only for current tab
//                     child: Text(controller.currentTab.value == index ? 'Continue' : 'Complete previous form'),
//                   ),
//                 ),
//               ],
//             );
//           }),
//         );
//       }),
//     );
//   }
// }
