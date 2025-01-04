  import 'package:document_fill_demo/utils/custom_text.dart';
import 'package:document_fill_demo/view/document_details.dart';
import 'package:document_fill_demo/view/entity_details.dart';
import 'package:document_fill_demo/view/stamp_paper_details.dart';
import 'package:flutter/material.dart';

Widget buildTabContent(String title) {
    switch (title) {
      case 'DOCUMENT':
        return DocumentDetailsPage();
      case 'ENTITY':
        return EntityDetails();
      case 'STAMP':
        return StampPaperDetails();
      case 'SIGNATORY':
        return Center(
            child: customText(
                text: 'Signatory Details Page',
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w700));
      default:
        return Center(
            child: customText(
                text: 'Other Details Page',
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w700));
    }
  }