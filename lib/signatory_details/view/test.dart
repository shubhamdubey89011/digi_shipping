// import 'package:document_fill_demo/signatory_details/controller/signatory_controller.dart';
// import 'package:document_fill_demo/signatory_details/view/test_view.dart';
// import 'package:get/get.dart';

// SignatoryController firstSignatoryController = Get.put(SignatoryController());
// SignatoryController secondSignatoryController = Get.put(SignatoryController());

// Column(
//   children: [
//     SignatoryForm(
//       controller: firstSignatoryController,
//       onContinue: () {
//         print("First signatory submitted!");
//       },
//       title: "First Signatory Details",
//     ),
//     SignatoryForm(
//       controller: secondSignatoryController,
//       onContinue: () {
//         print("Second signatory submitted!");
//       },
//       title: "Second Signatory Details",
//     ),
//     ElevatedButton(
//       onPressed: () {
//         // Add logic to dynamically add more signatories if needed
//       },
//       child: Text("Add Another Signatory"),
//     ),
//   ],
// );


// RmiWidgetHelper.verticalSpacer(20),
          // Obx(() {
          //   return RmiWidgetHelper.rmiColumn(
          //     childrens: [
          //       if (secondSignatoryController.hasData.value)
          //         SecondSignatoryDetails(
          //           onContinue: onContinue,
          //         ),
          //       RmiWidgetHelper.verticalSpacer(20),
          //       RmiWidgetHelper.customElevatedButton(
          //         color: ColorConstants.backgroundWhite,
          //         textColor: ColorConstants.fontDarkGrey,
          //         context: context,
          //         alignment: Alignment.centerLeft,
          //         text: "",
          //         isEnabled: secondSignatoryController.formVisible.value,
          //         onPressed: () {
          //           secondSignatoryController.toggleFormVisibility();
          //         },
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             RmiWidgetHelper.rmiText(
          //                 text: "Add Signatory Details",
          //                 color: ColorConstants.fontDarkGrey),
          //             Icon(
          //               Icons.add,
          //               color: ColorConstants.fontDarkGrey,
          //               size: 25,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   );
          // })