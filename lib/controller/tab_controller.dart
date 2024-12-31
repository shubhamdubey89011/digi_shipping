import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TabControllerClass extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  var currentTab = 0.obs;  // Reactive variable to track current tab
  var formCompletionStatus = [false, false, false, false].obs; // Reactive form completion status

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      currentTab.value = tabController.index;
    });
  }

  void onContinuePressed(int index) {
    if (index < formCompletionStatus.length - 1) {
      formCompletionStatus[index] = true;  // Mark current form as completed
      currentTab.value = index + 1;  // Move to next tab
      tabController.animateTo(currentTab.value);
    }
  }
}
