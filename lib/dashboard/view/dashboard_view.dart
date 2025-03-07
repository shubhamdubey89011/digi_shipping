import 'package:document_fill_demo/constants/assets_constants.dart';
import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/dimensions.dart';
import 'package:document_fill_demo/dashboard/controller/dashboard_controller.dart';
import 'package:document_fill_demo/dashboard/view/ui.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  String title = 'Varun';

  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: RmiWidgetHelper.rmiAppBar(
        spacing: 22,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: 'Hi $title',
        height: SizeConfig.screenHeight(context) / 15,
      ),
      backgroundColor: Color(0xFFF0EEFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ColorConstants.backgroundWhite,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RmiWidgetHelper.rmiText(
                        text: 'Quick Actions',
                        color: ColorConstants.fontDarkGrey,
                        fontWeight: FontWeight.w700),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        buildQuickAction(
                            color: ColorConstants.avatarColor1,
                            childrens: [Image.asset(AssetsConstants.dishtv)]),
                        RmiWidgetHelper.horizontalSpacer(15),
                        buildQuickAction(
                            color: ColorConstants.avatarColor2,
                            childrens: [Image.asset(AssetsConstants.tvs)]),
                        RmiWidgetHelper.horizontalSpacer(15),
                        buildQuickAction(
                            color: ColorConstants.avatarColor3,
                            childrens: [
                              SvgPicture.asset(
                                AssetsConstants.mobile,
                              ),
                              RmiWidgetHelper.rmiText(
                                text: 'Mobile',
                                fontSize: 6,
                                fontWeight: FontWeight.w800,
                              ),
                              Text(
                                'Recharge',
                                style: TextStyle(
                                    color: ColorConstants.fontDarkGrey,
                                    fontSize: 6,
                                    fontWeight: FontWeight.w800),
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ),
              RmiWidgetHelper.verticalSpacer(8),
              Obx(() {
                List<Widget> services = [
                  buildServiceTile(
                      SvgPicture.asset(AssetsConstants.inr), 'Financial', () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (context) => buildBottomSheet(context),
                    );
                  }, '', isNew: true, context),
                  buildServiceTile(SvgPicture.asset(AssetsConstants.aod),
                      'Mobile', () {}, 'Recharge', context),
                  buildServiceTile(SvgPicture.asset(AssetsConstants.school),
                      'Education', () {}, '', context),
                  buildServiceTile(
                      SvgPicture.asset(AssetsConstants.handShake),
                      'Digital',
                      () {},
                      'Agreement',
                      isPending: true,
                      context),
                  buildServiceTile(SvgPicture.asset(AssetsConstants.wallet),
                      'Easy', () {}, 'Pay', context),
                  buildServiceTile(SvgPicture.asset(AssetsConstants.groupWork),
                      'Choice', () {}, 'Connect', context),
                  buildServiceTile(SvgPicture.asset(AssetsConstants.realEstate),
                      'TVS', () {}, 'Loan', context),
                ];

                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstants.backgroundWhite,
                  ),
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12,
                    padding: EdgeInsets.all(13),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.9,
                    crossAxisCount: 4,
                    children: [
                      ...services,
                      if (dashboardController.isExpanded.value) ...[
                        buildServiceTile(
                            SvgPicture.asset(AssetsConstants.groupWork),
                            'Extra Service 1',
                            () {},
                            '',
                            context),
                        buildServiceTile(SvgPicture.asset(AssetsConstants.aod),
                            'Extra Service 2', () {}, '', context),
                        buildServiceTile(
                            SvgPicture.asset(AssetsConstants.wallet),
                            'Extra Service 3',
                            () {},
                            '',
                            context),
                      ],
                      GestureDetector(
                        onTap: () {
                          dashboardController.toggleExpansion();
                        },
                        child: Image.asset(
                          AssetsConstants.more,
                        ),
                      ),
                    ],
                  ),
                );
              }),

              RmiWidgetHelper.verticalSpacer(9),
              SizedBox(child: buildNotification(context)),
              RmiWidgetHelper.verticalSpacer(9),
              // buildCard(context),
              buildCardSlider(context),
              RmiWidgetHelper.verticalSpacer(16),
              buildHelpSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsConstants.help),
            label: 'HELP',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.home), label: 'HOME'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.history),
              label: 'HISTORY'),
        ],
      ),
    ));
  }
}
