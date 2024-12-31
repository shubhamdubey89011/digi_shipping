import 'package:get/get.dart';

class ToggleController extends GetxController {
  var selectedValue = 0.obs; // Observable integer for toggle options
  var entityType = 0.obs; // Observable integer for entity type toggle

  void updateSelectedValue(int value) {
    selectedValue.value = value;
  }

  void updateEntityType(int value) {
    entityType.value = value;
  }
}
