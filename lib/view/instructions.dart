
import 'package:document_fill_demo/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RmiWidgetHelper.rmiAppBar(elevation: 0,
        title: 'Simple',
        subtitle: 'Instructions',
        centerTitle: false,
        
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\u2022', // Unicode for a bullet point
                style: TextStyle(fontSize: 40), // Adjust size of the bullet
              ),
              const SizedBox(width: 8), // Space between bullet and text
              Expanded(
                child: RmiWidgetHelper.rmiText(
                    text:
                        'Prepare the Document: Ensure the agreement file is in the correct format (PDF)',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\u2022',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RmiWidgetHelper.rmiText(
                    text:
                        'Upload the File: Select the agreement document and upload it to the system.',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\u2022',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RmiWidgetHelper.rmiText(
                    text:
                        'Verify Details: Review the document and confirm all required fields.',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\u2022',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RmiWidgetHelper.rmiText(
                    text:
                        'Authenticate: Complete identity verification via OTP or other methods.',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\u2022',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RmiWidgetHelper.rmiText(
                    text:
                        'E-Sign & Submit: Apply your digital signature and finalize the process.',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset('assets/Help_Container.png')),
          // Expanded(child: svg),
        ],
      ),
    );
  }

  // final Widget svg = SvgPicture.asset(
  //   'assets/Help_Container.svg', fit: BoxFit.contain,
  //   // semanticsLabel: 'Dart Logo',
  // );
}
