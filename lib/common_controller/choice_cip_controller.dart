import 'package:get/get.dart';

class ToggleController extends GetxController {
  var selectedIndex = 0.obs;

  void updateSelection(int index) {
    selectedIndex.value = index;
  }
}
