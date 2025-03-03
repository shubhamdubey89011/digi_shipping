// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelperOther {
//   static Database? _database;
//   static const String tableName = 'otherSignatory';

//   static Future<Database> get database async {
//     if (_database != null) return _database!;
    
//     _database = await _initDatabase();
//     return _database!;
//   }

//   static Future<Database> _initDatabase() async {
//     final path = join(await getDatabasesPath(), 'signatory.db');
//     return openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE $tableName (
//             mobileNumber TEXT PRIMARY KEY,
//             name TEXT,
//             idProof TEXT,
//             email TEXT,
//             relationship TEXT,
//             dateOfBirth TEXT,
//             gender TEXT
//           )
//         ''');
//       },
//     );
//   }

//   static Future<int> insertSignatory(Map<String, dynamic> signatory) async {
//     final db = await database;
//     return await db.insert(tableName, signatory, conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   static Future<List<Map<String, dynamic>>> getSignatories() async {
//     final db = await database;
//     return await db.query(tableName);
//   }

//   static Future<int> deleteSignatory(String mobileNumber) async {
//     final db = await database;
//     return await db.delete(tableName, where: 'mobileNumber = ?', whereArgs: [mobileNumber]);
//   }
// }
