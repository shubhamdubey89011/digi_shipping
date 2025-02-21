import 'package:document_fill_demo/binding/app_binding.dart';
import 'package:document_fill_demo/db_helper/db_helper.dart';
import 'package:document_fill_demo/view/document_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();

  final dbHelper = DatabaseHelper();

  try {
    //  await dbHelper.deleteDatabaseFile();

    await dbHelper.database;
    print("Databases initialized successfully");
  } catch (e) {
    print("Error initializing databases: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      home: DocumentDetailsPage(),
    );
  }
}
