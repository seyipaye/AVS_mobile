import 'package:avs/data/models/request.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dir = await getApplicationDocumentsDirectory();
    var path = dir.path;
    return await openDatabase(path + 'avs.db', onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE requests (
       verificationNumber TEXT PRIMARY KEY,
      firstName TEXT,
      lastName TEXT,
      gender TEXT,
      streetAddress TEXT,
      state TEXT,
      lga TEXT,
      postalCode TEXT,
      latitude TEXT,
      longitude TEXT,
      status TEXT
        )
        ''');
    }, version: 1);
  }

  ///Create
  Future<int> addRequest(Map<String, dynamic> request) async {
    print('Adding');
    final db = await database;
    var res = await db.rawInsert('''
    INSERT INTO requests(
    verificationNumber, firstName, lastName , gender , streetAddress, state, lga, postalCode, latitude, longitude, status 
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      request['verificationNumber'],
      request['firstName'],
      request['lastName'],
      request['gender'],
      request['streetAddress'],
      request['state'],
      request['lga'],
      request['postalCode'],
      request['latitude'],
      request['longitude'],
      request['status']
    ]);

    return res;
  }

  ///Get all assigned requests from table
  Future<List<Request>> getAssignedRequests() async {
    final db = await database;
    final res = await db.query('requests');
    if (res.isEmpty) {
      return [];
    } else {
      return res.map((e) => Request.fromDb(e)).toList();
    }
  }

  /// Wipe database
  Future<void> deleteTable() async {
    final db = await database;
    // await db.rawDelete(sql)
  }
}
