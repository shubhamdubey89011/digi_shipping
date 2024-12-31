import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabControllerClass extends GetxController {
  var currentTabIndex = 0.obs; // Reactive variable for tab index
  final List<Tab> tabs = [
    const Tab(
      child: Column(
        children: [
          Text('DOCUMENT', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('DETAILS', style: TextStyle(fontSize: 12)),
        ],
      ),
    ),
    const Tab(
      child: Column(
        children: [
          Text('PARTY', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('DETAILS', style: TextStyle(fontSize: 12)),
        ],
      ),
    ),
    const Tab(
      child: Column(
        children: [
          Text('STAMP PAPER', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('DETAILS', style: TextStyle(fontSize: 12)),
        ],
      ),
    ),
    const Tab(
      child: Column(
        children: [
          Text('SIGNATORY', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('DETAILS', style: TextStyle(fontSize: 12)),
        ],
      ),
    ),
  ];
}