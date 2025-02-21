import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildQuickAction(Image img) {
  return Column(
    children: [
      CircleAvatar(backgroundColor: Color(0xFFE7F3FF),
        radius: 40,
        child: img,
      ),
      SizedBox(height: 5),
   
    ],
  );
}

Widget buildServiceTile(IconData icon, String title,
    {bool isNew = false, bool isPending = false}) {
  return Stack(
    children: [
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 30),
              SizedBox(height: 5),
              Text(title),
            ],
          ),
        ),
      ),
      if (isNew)
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Text('NEW',
                style: TextStyle(color: Colors.white, fontSize: 10)),
          ),
        ),
      if (isPending)
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Text('PENDING',
                style: TextStyle(color: Colors.white, fontSize: 10)),
          ),
        ),
    ],
  );
}

Widget buildBillNotification() {
  return Card(
    color: Colors.lightBlueAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: ListTile(
      leading: Icon(Icons.tv, color: Colors.white),
      title: Text('Your Dishtv Bill Of ₹1,200 Is Due Tomorrow.',
          style: TextStyle(color: Colors.white)),
      trailing: ElevatedButton(onPressed: () {}, child: Text('Pay Now')),
    ),
  );
}

Widget buildPromotion(String text, Gradient gradient, String secondText,
    String thirdText, SvgPicture svg) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: gradient,
    ),
    child: Stack(
      children: [
        Card(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RmiWidgetHelper.rmiText(text: text),
                    SizedBox(
                      width: 30,
                    ),
                    svg,
                  ],
                ),
                RmiWidgetHelper.rmiText(text: secondText),
                RmiWidgetHelper.rmiText(text: thirdText),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
