import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomToggleController extends GetxController {
  final selectedValue = 0.obs;

  void updateSelectedValue(int value) {
    selectedValue.value = value;
  }
}

