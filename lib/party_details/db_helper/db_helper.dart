import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _firstPartyDatabase;
  static Database? _secondPartyDatabase;
  static Database? _signatoryDatabase;
  static Database? _secondsignatoryDatabase;

  DatabaseHelper._internal();

  Future<Database> get firstpartydatabase async {
    if (_firstPartyDatabase != null) return _firstPartyDatabase!;
    _firstPartyDatabase = await _initFirstPartyDatabase();
    return _firstPartyDatabase!;
  }

  Future<Database> get secondpartydatabase async {
    if (_secondPartyDatabase != null) return _secondPartyDatabase!;
    _secondPartyDatabase = await _initSecondPartyDatabase();
    return _secondPartyDatabase!;
  }

  Future<Database> get signatorydatabase async {
    if (_signatoryDatabase != null) return _signatoryDatabase!;
    _signatoryDatabase = await _initSignatoryDatabase();
    return _signatoryDatabase!;
  }

  Future<Database> get secondsignatorydatabase async {
    if (_secondsignatoryDatabase != null) return _secondsignatoryDatabase!;
    _secondsignatoryDatabase = await _initSignatoryDatabase2();
    return _secondsignatoryDatabase!;
  }

  Future<Database> _initFirstPartyDatabase() async {
    String firstpartypath =
        join(await getDatabasesPath(), 'firstpartydetails.db');
    return await openDatabase(
      firstpartypath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE firstpartydetails (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
           name TEXT,
            idProofNumber NUMBER,
            mobileNumber NUMBER,
            pinCode NUMBER,
            selectedProof TEXT
          )
        ''');
      },
    );
  }

  Future<Database> _initSecondPartyDatabase() async {
    String secondpartypath =
        join(await getDatabasesPath(), 'secondpartydetails.db');
    return await openDatabase(
      secondpartypath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE secondpartydetails (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            idProofNumber NUMBER,
            mobileNumber NUMBER,
            pinCode NUMBER,
            selectedProof TEXT
          )
        ''');
      },
    );
  }

  Future<Database> _initSignatoryDatabase() async {
    String signatorypath =
        join(await getDatabasesPath(), 'signatorydetails.db');
    return await openDatabase(
      signatorypath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE signatorydetails (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            idProofNumber NUMBER,
            mobileNumber NUMBER,
            email TEXT,
            relationship TEXT,
            gender TEXT,
            dob TEXT,
            selectedParty TEXT,
            selectedProof TEXT
          )
        ''');
      },
    );
  }

  Future<Database> _initSignatoryDatabase2() async {
    String secondsignatorypath =
        join(await getDatabasesPath(), 'secondsignatorydetails.db');
    return await openDatabase(
      secondsignatorypath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE secondsignatorydetails (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            idProofNumber NUMBER,
            mobileNumber NUMBER,
            email TEXT,
            relationship TEXT,
            gender TEXT,
       
            selectedParty TEXT,
            selectedProof TEXT
          )
        ''');
      },
    );
  }
  //For First Party Details Database

  Future<void> deleteDatabaseFiles() async {
    // final firstpartypath =
    //     join(await getDatabasesPath(), 'firstpartydetails.db');
    // final secondpartypath =
    //     join(await getDatabasesPath(), 'secondpartydetails.db');
    // final signatorypath =
    //     join(await getDatabasesPath(), 'signatorydetails.db');
    final secondsignatorypath =
        join(await getDatabasesPath(), 'secondsignatorydetails.db');

    // await deleteDatabase(firstpartypath);
    // await deleteDatabase(secondpartypath);
    await deleteDatabase(secondsignatorypath);
  }

  Future<int> insertDatToSqLite(
      {required Map<String, dynamic> data, required String tableName}) async {
    final db = await firstpartydatabase;
    return await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> fetchAllPartyDetails(
      {required String tableName}) async {
    final db = await firstpartydatabase;
    final result = await db.query(tableName);
    print("Fetched data from the table: $result");
    return result;
  }

  Future<Map<String, dynamic>?> fetchLastPartyDetail(
      {required String tableName}) async {
    final db = await firstpartydatabase;
    final List<Map<String, dynamic>> result = await db.query(
      tableName,
      orderBy: 'id DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<int> deleteAllDataFromTable({required String tableName}) async {
    final db = await firstpartydatabase;
    return await db.delete(tableName);
  }

  Future<int> updateAllDetails(
      {required Map<String, dynamic> data, required String tableName}) async {
    final db = await firstpartydatabase;
    final result = await db.update(tableName, data);
    return result;
  }

  //For Second Party Details Database

  Future<int> insertDatToSqLite1(
      {required Map<String, dynamic> data, required String tableName}) async {
    final db = await secondpartydatabase;
    return await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> fetchAllPartyDetails1(
      {required String tableName}) async {
    final db = await secondpartydatabase;
    final result = await db.query(tableName);
    print("Fetched data from the table: $result");
    return result;
  }

  Future<int> deleteAllDataFromTable1({required String tableName}) async {
    final db = await secondpartydatabase;
    return await db.delete(tableName);
  }

  Future<Map<String, dynamic>?> fetchLastPartyDetail1(
      {required String tableName}) async {
    final db = await secondpartydatabase;
    final List<Map<String, dynamic>> result = await db.query(
      tableName,
      orderBy: 'id DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  //For First Signatory Details Database

  Future<int> insertDatToSqLite2(
      {required Map<String, dynamic> data, required String tableName}) async {
    final db = await signatorydatabase;
    return await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> fetchAllPartyDetails2(
      {required String tableName}) async {
    final db = await signatorydatabase;
    return await db.query(tableName);
  }

  Future<int> deleteAllDataFromTable2({required String tableName}) async {
    final db = await signatorydatabase;
    return await db.delete(tableName);
  }

  Future<Map<String, dynamic>?> fetchLastPartyDetail2(
      {required String tableName}) async {
    final db = await signatorydatabase;
    final List<Map<String, dynamic>> result = await db.query(
      tableName,
      orderBy: 'id DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
  //For Second Signatory Details Database

  Future<int> insertDatToSqLite3(
      {required Map<String, dynamic> data, required String tableName}) async {
    final db = await secondsignatorydatabase;
    return await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> fetchAllPartyDetails3(
      {required String tableName}) async {
    final db = await secondsignatorydatabase;
    return await db.query(tableName);
  }

  Future<int> deleteAllDataFromTable3({required String tableName}) async {
    final db = await secondsignatorydatabase;
    return await db.delete(tableName);
  }

  Future<Map<String, dynamic>?> fetchLastPartyDetail3(
      {required String tableName}) async {
    final db = await secondsignatorydatabase;
    final List<Map<String, dynamic>> result = await db.query(
      tableName,
      orderBy: 'id DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
