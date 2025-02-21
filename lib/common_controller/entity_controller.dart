import 'package:get/get.dart';

class EntityDetailsController extends GetxController {
  // Reactive boolean for the checkbox state
  RxBool isCheckboxChecked = false.obs;

  // Toggle checkbox state
  void toggleCheckbox(bool value) {
    isCheckboxChecked.value = value;
  }
}
