import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;
  static const String _databaseName = "rmiapp_database.db";
  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    String path = join(await getDatabasesPath(), _databaseName);
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createTables(db);
      },
    );
    return _database!;
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE firstpartydetails (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        idProofNumber TEXT,
        mobileNumber INTEGER,
        pinCode INTEGER,
        selectedProof TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE secondpartydetails (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        idProofNumber TEXT,
        mobileNumber INTEGER,
        pinCode INTEGER,
        selectedProof TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE signatorydetails (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        idProofNumber TEXT,
        mobileNumber INTEGER,
        email TEXT,
        relationship TEXT,
        gender TEXT,
        dob TEXT,
        selectedParty TEXT,
        selectedProof TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE secondsignatorydetails (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        idProofNumber TEXT,
        mobileNumber INTEGER,
        email TEXT,
        relationship TEXT,
        dob TEXT,
        gender TEXT,
        selectedParty TEXT,
        selectedProof TEXT
      )
    ''');

    await db.execute('''
    CREATE TABLE othersignatories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      idProofNumber TEXT,
      mobileNumber INTEGER,
      email TEXT,
      relationship TEXT,
      dob TEXT,
      gender TEXT,
      selectedParty TEXT,
      selectedProof TEXT
    )
  ''');
  }

  Future<int> insertData(
      {required Map<String, dynamic> data, required String tableName}) async {
    final db = await database;
    return await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> fetchAllDetails(
      {required String tableName}) async {
    final db = await database;
    return await db.query(tableName);
  }

  Future<Map<String, dynamic>?> fetchLastDetail(
      {required String tableName}) async {
    final db = await database;
    final result = await db.query(tableName, orderBy: 'id DESC', limit: 1);
    return result.isNotEmpty ? result.first : null;
  }

  Future<int> deleteAllData({required String tableName}) async {
    final db = await database;
    return await db.delete(tableName);
  }

  Future<int> updateDetails(
      {required Map<String, dynamic> data, required String tableName}) async {
    final db = await database;
    return await db
        .update(tableName, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<void> deleteDatabaseFile() async {
    String path = join(await getDatabasesPath(), _databaseName);
    await deleteDatabase(path);
    _database = null;
  }
}
