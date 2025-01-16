import 'package:document_fill_demo/binding/app_binding.dart';
import 'package:document_fill_demo/party_details/db_helper/db_helper.dart';
import 'package:document_fill_demo/party_details/model/party_model.dart';
import 'package:document_fill_demo/view/document_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // Initialize the database factory for FFI
   WidgetsFlutterBinding.ensureInitialized();
   AppBinding().dependencies();
   var directory = await getApplicationDocumentsDirectory() ;
  Hive.init(directory.path);

  Hive.registerAdapter(PartyModelAdapter()) ;
  await Hive.openBox<PartyModel>('partyBox');

   
  final dbHelper = DatabaseHelper();

try {
  // await dbHelper.deleteDatabaseFiles();
  await dbHelper.firstpartydatabase;
  await dbHelper.secondpartydatabase;
  await dbHelper.signatorydatabase;
  await dbHelper.secondsignatorydatabase;
  print("Databases initialized successfully");
} catch (e) {
  print("Error initializing databases: $e");
}
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DocumentDetailsPage(),
      initialBinding: AppBinding(),
    );
  }
}
