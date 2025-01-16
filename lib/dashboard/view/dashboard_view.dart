// import 'package:document_fill_demo/constants/color_constants.dart';
// import 'package:document_fill_demo/dashboard/view/ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class DashboardView extends StatelessWidget {
//   DashboardView({super.key});

//   String title = 'Varun';

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('Hi $title'),
//         backgroundColor: Colors.transparent,
//       ),
//       endDrawer: IconButton(
//         icon: SvgPicture.asset(
//           'assets/icons/ham_burger.svg',
//           height: 20,
//           width: 20,
//           color: Colors.black,
//         ),
//         onPressed: () {},
//       ),
//       backgroundColor: Color(0xFFF0EEFF),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Quick Actions',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: BouncingScrollPhysics(),
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: [
//                   buildQuickAction(

//                     Image.asset('assets/icons/dishtv.png')
//                     // SvgPicture.asset(
//                     //   'assets/icons/dishtv.png',
//                     //   color: Colors.black,
//                     // ),
//                   ),
//                   buildQuickAction(

//                     Image.asset('assets/icons/tvscredit.png')
//                     // SvgPicture.asset(
//                     //   'assets/icons/tvs_credit.png',
//                     // ),
//                   ),
//                   buildQuickAction(Image.asset('assets/icons/mobile.png')
//                     // SvgPicture.asset(
//                     //   'assets/icons/mobile.png',
//                     // ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Services',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: BouncingScrollPhysics(),
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: [
//                   buildServiceTile(Icons.attach_money, 'Financial',
//                       isNew: true),
//                   buildServiceTile(Icons.phone_android, 'Mobile Recharge'),
//                   buildServiceTile(Icons.school, 'Education'),
//                   buildServiceTile(Icons.assignment, 'Digital Agreement',
//                       isPending: true),
//                   buildServiceTile(Icons.payment, 'Easy Pay'),
//                   buildServiceTile(
//                       Icons.connect_without_contact, 'Choice Connect'),
//                   buildServiceTile(Icons.car_rental, 'TVS Loan'),
//                   buildServiceTile(Icons.more_horiz, 'More'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               buildBillNotification(),
//               SizedBox(height: 20),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 physics: BouncingScrollPhysics(),
//                 child: Row(
//                   children: [
//                     Column(
//                       children: [
//                         buildPromotion(
//                           'AEPS Karnataka gov',
//                           LinearGradient(
//                               colors: ColorConstants.linearGradientColor1,
//                               transform: GradientRotation(24)),
//                           'Cash Withdrawal',
//                           'Available Now !',
//                           SvgPicture.asset(
//                             height: 20,
//                             width: 20,
//                             'assets/icons/Arrow2.svg',
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     buildPromotion(
//                       'AXIS',
//                       LinearGradient(
//                           colors: ColorConstants.linearGradientColor2,
//                           transform: GradientRotation(24)),
//                       'CRM Lead',
//                       'Generation',
//                       SvgPicture.asset(
//                         'assets/icons/Arrow2.svg',
//                         height: 20,
//                         width: 20,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 1,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.help), label: 'HELP'),
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: 'HISTORY'),
//         ],
//       ),
//     ));
//   }
// }
