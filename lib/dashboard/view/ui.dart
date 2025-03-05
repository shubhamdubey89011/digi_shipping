import 'package:carousel_slider/carousel_slider.dart';
import 'package:document_fill_demo/constants/assets_constants.dart';
import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/dimensions.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

Widget buildQuickAction(
    {required List<Widget> childrens, required Color color}) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: color,
        radius: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: childrens,
        ),
      ),
    ],
  );
}

Widget buildServiceTile(
  SvgPicture svg,
  String title,
  VoidCallback onPressed,
  String subtitle,
  BuildContext context, {
  bool isNew = false,
  bool isPending = false,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
        height: screenHeight * 0.07,
        width: screenWidth * 0.25,
        decoration: BoxDecoration(
          color: ColorConstants.backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: onPressed, icon: svg),
          ],
        ),
      ),
      if (isNew || isPending)
        Positioned(
          top: -screenHeight * 0.0001,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.01,
              vertical: screenHeight * 0.002,
            ),
            decoration: BoxDecoration(
              color: isNew ? Colors.blue : Color(0xFFEABD2B),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              isNew ? 'NEW' : 'PENDING',
              style: TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      Positioned(
        bottom: -screenHeight * 0.007,
        child: RmiWidgetHelper.rmiText(
          text: title.toUpperCase(),
          fontSize: 9,
        ),
      ),
    ],
  );
}

Widget buildNotification(BuildContext context) {
  return Container(
    height: SizeConfig.screenHeight(context) / 12,
    // height: 71,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorConstants.backgroundWhite),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: ColorConstants.avatarColor1,
          child: Image.asset('assets/icons/dishtv.png'),
        ),
        Text(
          'Your Dishtv Bill Of ₹1,200 Is Due Tomorrow.',
        )
      ],
    ),
  );
}

Widget buildBottomSheet(BuildContext context) {
  return Container(
    height: SizeConfig.screenHeight(context) / 2,
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RmiWidgetHelper.rmiText(
                text: 'Financial',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorConstants.fontDarkGrey),
            IconButton(
              onPressed: () {
                Get.close(1);
              },
              icon: SvgPicture.asset(
                AssetsConstants.close,
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  icon: Image.asset(AssetsConstants.groupInr),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RmiWidgetHelper.rmiText(
                    text: 'PAY BILLS',
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Image.asset(AssetsConstants.groupInr),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RmiWidgetHelper.rmiText(
                    text: 'DMT', fontSize: 10, fontWeight: FontWeight.w700),
                RmiWidgetHelper.rmiText(
                    text: 'SERVICES',
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Image.asset(AssetsConstants.groupInr),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RmiWidgetHelper.rmiText(
                    text: 'EAPS', fontSize: 10, fontWeight: FontWeight.w700),
                RmiWidgetHelper.rmiText(
                    text: 'SERVICES',
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget rmiKarnataGovCard(BuildContext context) {
  return Stack(
    children: [
      Image.asset(
        'assets/icons/karnataka_gov.png',
        fit: BoxFit.contain,
        width: SizeConfig.screenWidth(context) / 2.3,
        height: SizeConfig.screenHeight(context) / 4,
      ),
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RmiWidgetHelper.rmiText(
              text: 'AEPS Karnataka gov',
              fontSize: 10,
            ),
            RmiWidgetHelper.rmiText(
                text: 'Cash Withdrawal',
                fontSize: 10,
                fontWeight: FontWeight.w400),
            RmiWidgetHelper.rmiText(
              text: 'Available Now !',
              fontSize: 10,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget rmiAxisBankCard(BuildContext context) {
  return Stack(
    children: [
      Image.asset(
        'assets/icons/axis_bank.png',
        fit: BoxFit.contain,
        width: SizeConfig.screenWidth(context) / 2.3,
        height: SizeConfig.screenHeight(context) / 4,
      ),
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RmiWidgetHelper.rmiText(
              text: 'AXIS',
              fontSize: 10,
            ),
            RmiWidgetHelper.rmiText(
              text: 'CRM Lead',
              fontSize: 10,
            ),
            RmiWidgetHelper.rmiText(
              text: 'Generation',
              fontSize: 10,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildCardSlider(BuildContext context) {
  final List<Widget> cardPairs = [
    Row(
      children: [
        Expanded(child: rmiKarnataGovCard(context)),
        SizedBox(width: 12),
        Expanded(child: rmiAxisBankCard(context)),
      ],
    ),
    Row(
      children: [
        Expanded(child: rmiKarnataGovCard(context)),
        SizedBox(width: 12),
        Expanded(child: rmiAxisBankCard(context)),
      ],
    ),
  ];

  return CarouselSlider(
    options: CarouselOptions(
      height: SizeConfig.screenHeight(context) / 10,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 1,
      aspectRatio: 2.5,
      enableInfiniteScroll: true,
    ),
    items: cardPairs,
  );
}

Widget buildHelpSection(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorConstants.backgroundWhite,
          border: Border.all(color: ColorConstants.borderColor),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset(AssetsConstants.shrug, height: 40),
            ),
            RmiWidgetHelper.horizontalSpacer(100),
            MaterialButton(
              height: SizeConfig.screenHeight(context) / 26,
              minWidth: SizeConfig.screenWidth(context) / 4,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              color: Colors.black,
              onPressed: () {},
              child: RmiWidgetHelper.rmiText(
                text: 'HELP',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        left: SizeConfig.screenWidth(context) / 5,
        top: -10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset(
            AssetsConstants.questionMark,
          ),
        ),
      ),
    ],
  );
}
