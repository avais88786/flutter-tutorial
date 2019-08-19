import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tutorial/servies/IMapImplementor.dart';

class DatabaseHelperService {
  static final String _databaseName = 'tutorial.db';
  static final int _databaseVersion = 1;

  DatabaseHelperService._privateConstructor();
  static final DatabaseHelperService instance =
      DatabaseHelperService._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String path = join(appDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE USER ' +
        '(UserID INTEGER PRIMARY KEY AUTOINCREMENT,' +
        'FirstName TEXT NOT NULL, LastName TEXT NOT NULL, ' +
        'NewsLetter INTEGER NOT NULL, ' +
        'Cooking INTEGER NOT NULL, ' +
        'Hiking INTEGER NOT NULL, ' +
        'Travelling INTEGER NOT NULL');
  }

  Future<int> create<T extends IMapImplementor>(T data, String tableName) async {
    var db = await database;
    int id = await db.insert(tableName, data.toMap());
    return id;
  }

  Future<T> read<T>(){
    
  }

}
