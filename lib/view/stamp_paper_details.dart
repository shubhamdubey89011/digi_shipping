import 'package:document_fill_demo/utils/custom_appbar.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StampPaperDetails extends StatelessWidget {
  StampPaperDetails({super.key});

  final RxString selectedState = ''.obs;

  final List<String> articles = [
    'Article Code *',
    'abc',
    'abcd',
    'abcde',
    'abcdef',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 238, 255, 1),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 460,
                width: 327,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color.fromRGBO(141, 188, 211, 1)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: 'Stamp Paper Details',
                        color: Color.fromRGBO(78, 77, 77, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => Container(
                          height: 42,
                          width: 291,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(
                                  141, 188, 211, 1), // Border color
                              width: 1.0, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                          child: DropdownButton<String>(
                            focusColor: Colors.transparent,
                            icon: SvgPicture.asset(
                              'assets/icons/dropdown.svg',
                              height: 20,
                              width: 20,
                            ),
                            isExpanded: true,
                            underline:
                                const SizedBox(), // Removes default underline
                            value: selectedState.value.isEmpty
                                ? articles[0]
                                : selectedState.value,
                            items: articles
                                .map(
                                  (state) => DropdownMenuItem<String>(
                                    value: state,
                                    child: customText(
                                      text: state,
                                      color: Color.fromRGBO(78, 77, 77, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                selectedState.value = value;
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 42,
                        width: 291,
                        child: customTextField(
                            labelText: 'Consideration Price*',
                            color: Color.fromRGBO(78, 77, 77, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 42,
                        width: 291,
                        child: customTextField(
                            labelText: 'Stamp Duty Price*',
                            color: Color.fromRGBO(78, 77, 77, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 42,
                        width: 291,
                        child: customTextField(
                            labelText: 'Stamp duty Paid by*',
                            color: Color.fromRGBO(78, 77, 77, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 42,
                        width: 291,
                        child: customTextField(
                            labelText: 'Description Of the Agreement*',
                            color: Color.fromRGBO(78, 77, 77, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 42,
                        width: 291,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              const Color.fromRGBO(55, 0, 179, 1),
                            ),
                          ),
                          child: customText(
                              text: 'Continue',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
