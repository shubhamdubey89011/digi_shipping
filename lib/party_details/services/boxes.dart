import 'package:document_fill_demo/party_details/model/party_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<PartyModel> getData() => Hive.box<PartyModel>('party');
}