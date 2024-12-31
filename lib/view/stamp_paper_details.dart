import 'package:document_fill_demo/utils/custom_appbar.dart';
import 'package:document_fill_demo/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(backgroundColor: Color.fromRGBO(240, 238, 255, 1),
      
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              
              Material(
                type: MaterialType.card,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    
                    children: [
                       Text('Stamp Paper Details',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
              SizedBox(
                height: 10,
              ),
                      Material(
                child: Obx(
                            () => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(141, 188, 211, 1),// Border color
                                  width: 1.0, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    8), // Rounded corners
                              ),
                              child: DropdownButton<String>(focusColor: Colors.transparent,
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
                                        child: Text(state,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
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
              ),SizedBox(height: 10,),
                      Material(
                        clipBehavior: Clip.antiAlias,
                        type: MaterialType.card,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Color.fromRGBO(141, 188, 211, 1),
                            )),
                        child: customTextField(
                          labelText: 'Consideration Price*',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                          type: MaterialType.card,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color.fromRGBO(141, 188, 211, 1),
                              )),
                          child: customTextField(labelText: 'Stamp Duty Price*')),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                          type: MaterialType.card,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color.fromRGBO(141, 188, 211, 1),
                              )),
                          child:
                              customTextField(labelText: 'Stamp duty Paid by*')),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                          type: MaterialType.card,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color.fromRGBO(141, 188, 211, 1),
                              )),
                          child: customTextField(labelText: 'Description Of the Agreement*')),
                      SizedBox(height: 10,),
                      Material(
                          type: MaterialType.card,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color.fromRGBO(141, 188, 211, 1),
                              )),
                          child: SizedBox(width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),backgroundColor: WidgetStatePropertyAll(const Color.fromRGBO (55, 0, 179,1))
                              ),
                              child: Text('Continue',style: TextStyle(color: Colors.white),),
                            ),
                          )),
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