import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'party_details.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE partyDetails (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            idProofNumber TEXT,
            mobileNumber NUMBER,
            pinCode NUMBER,
            selectedProof TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertPartyDetails(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('partyDetails', data);
  }

  Future<List<Map<String, dynamic>>> fetchAllPartyDetails() async {
    final db = await database;
    return await db.query('partyDetails');
  }
}
