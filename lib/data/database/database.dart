import 'package:avs/data/models/document.dart';
import 'package:avs/data/models/failed_verification_upload.dart';
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
      await db.execute('''
        CREATE TABLE failedVerificationUploads (
       id TEXT PRIMARY KEY,
      reasons TEXT,
      latitude TEXT,
      longitude TEXT,
     assessment TEXT,
     documentPath TEXt
        )
        ''');
    }, version: 1);
  }

  ///Add to database
  Future<int> addRequest(Map<String, dynamic> request) async {
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
      return <Request>[];
    } else {
      return res.map((e) => Request.fromDb(e)).toList();
    }
  }

  /// Wipe database
  Future<void> deleteTable() async {
    final db = await database;
    // await db.rawDelete(sql)
  }

  Future<int> dropRequestTable() async {
    final db = await database;
    var res = await db.delete('requests');
    return res;
  }

  ///Add to database
  Future<int> addFailedVerification(Map<String, dynamic> verification) async {
    final db = await database;
    var res = await db.rawInsert('''
    INSERT INTO failedVerificationUploads(
    id, reasons, latitude, longitude, assessment, documentPath
    ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      verification['id'],
      verification['reasons'],
      verification['latitude'],
      verification['longitude'],
      verification['assessment'],
      verification['documentPath']
    ]);

    return res;
  }

  Future<int> addDocument(Map<String, dynamic> document, String id) async {
    final db = await database;
    var res = await db.rawInsert('''
    INSERT INTO document(
    id, title, value, type, label, url, backendtype,
    ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      id,
      document['title'],
      document['value'],
      document['type'],
      document['label'],
      document['url'],
      document['backendtype'],
    ]);

    return res;
  }

  Future<List<FailedVerificationUpload>> getFailedVerification() async {
    final db = await database;
    final res = await db.query('failedVerificationUploads');
    if (res.isEmpty) {
      return <FailedVerificationUpload>[];
    } else {
      return res.map((e) => FailedVerificationUpload.fromDb(e)).toList();
    }
  }

  Future<int> deleteFailedVerification(String id) async {
    final db = await database;
    final res = await db
        .delete("failedVerificationUploads", where: "id = ?", whereArgs: [id]);
    return res;
  }
}
