import 'package:document_fill_demo/controller/entity_controller.dart';
import 'package:document_fill_demo/utils/custom_appbar.dart';
import 'package:document_fill_demo/utils/custom_material.dart';
import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntityDetails extends StatelessWidget {
  const EntityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EntityDetailsController());
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 238, 255, 1),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                type: MaterialType.card,
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    customText(
                      text: 'First and Second Party details are mandatory.',
                    ),
                    customText(
                      text: 'These details will be printed on the stamp papper',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                type: MaterialType.card,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Entity Details',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                        child: customTextField(
                          labelText: 'Name *',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                          child: customTextField(labelText: 'Email *')),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                        child: customTextField(labelText: 'Contact Number *'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                          child: customTextField(labelText: 'PAN Number *')),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                        child: customTextField(
                          labelText: 'Legal Constitution of the Party *',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                          child: customTextField(
                              labelText: 'Date Of Incorporation *')),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                        child: customTextField(
                            labelText: 'Registered Office Address *'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                        child: customTextField(
                            labelText: 'Registered Office Address Pincode *'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: controller.isCheckboxChecked.value,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.toggleCheckbox(value);
                                }
                              },
                            ),
                            const SizedBox(
                                width:
                                    8), // Add spacing between checkbox and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Tick if Communication address"),
                                Text("Same as Registered Office Address"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                          child: customTextField(
                              labelText: 'Communication Address *')),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                        child: customTextField(
                            labelText: 'Communication Address Pincode *'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                        child: customTextField(
                            labelText: 'Communication Address Pincode *'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customMaterial(
                          child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromRGBO(55, 0, 179, 1))),
                          child: Text(
                            'Continue',
                            style: TextStyle(color: Colors.white),
                          ),
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