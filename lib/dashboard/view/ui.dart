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

Widget buildServiceTile(SvgPicture svg, String title, VoidCallback onPressed,
    String subtitle, BuildContext context,
    {bool isNew = false, bool isPending = false}) {
  return Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.screenHeight(context) / 20,
            width: SizeConfig.screenWidth(context) / 5.5,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorConstants.backgroundColor,
            ),
            child: IconButton(onPressed: onPressed, icon: svg),
          ),
          RmiWidgetHelper.rmiText(text: title, fontSize: 9),
          RmiWidgetHelper.rmiText(text: subtitle, fontSize: 9),
        ],
      ),
      if (isNew || isPending)
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 1, right: 5),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isNew ? Colors.blue : Color(0xFFEABD2B),
              borderRadius: BorderRadius.circular(2),
            ),
            child: RmiWidgetHelper.rmiText(
              text: isNew ? 'NEW' : 'PENDING',
              fontSize: 7,
              color: isNew ? Colors.white : Color(0xFF1E1E1E),
              fontWeight: FontWeight.w600,
            ),
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
        padding: const EdgeInsets.all(22.0),
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
        padding: const EdgeInsets.all(22.0),
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
        SizedBox(width: 10),
        Expanded(child: rmiAxisBankCard(context)),
      ],
    ),
    Row(
      children: [
        Expanded(child: rmiKarnataGovCard(context)),
        SizedBox(width: 10),
        Expanded(child: rmiAxisBankCard(context)),
      ],
    ),
  ];

  return CarouselSlider(
    options: CarouselOptions(
      height: SizeConfig.screenWidth(context) / 4,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.5,
      enableInfiniteScroll: true,
    ),
    items: cardPairs,
  );
}
