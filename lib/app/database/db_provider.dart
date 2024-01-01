import 'dart:async';
import 'dart:io';

import 'package:hello_world/app/model/employee_data_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "test.db";
  static const _databaseVersion = 1;

  static const table = 'EmployeesData';

  static const columnId = 'id';
  static const columnName = 'eName';
  static const columnRole = 'eRoll';
  static const columnFromDate = 'fromDate';
  static const columnToDate = 'toDate';
  static const columnWeek = 'week';
  static const columnCreatedAt = 'createdAt';
  static const columnIsDone = 'isDone';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Lazily instantiate the database if unavailable
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database, creating if it doesn't exist
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
           CREATE TABLE $table (
             $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
             $columnName TEXT,
             $columnRole TEXT,
             $columnFromDate TEXT,
             $columnToDate TEXT,
             $columnWeek TEXT,
             $columnCreatedAt TEXT,
             $columnIsDone TEXT
           )
           ''');
  }

  // Insert a note into the database
  Future<int> insert(EmployeesModel note) async {
    Database db = await instance.database;
    return await db.insert(table, note.toMap());
  }

  // Retrieve all notes from the database
  Future<List<EmployeesModel>> getAllData() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return EmployeesModel.fromMap(maps[i]);
    });
  }

  // Update a note in the database
  Future<int> update(EmployeesModel note) async {
    Database db = await instance.database;
    return await db.update(table, note.toMap(),
        where: '$columnId = ?', whereArgs: [note.id]);
  }

  // Delete a note from the database
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int?> getCount() async {
    Database db = await instance.database;
    int? count =
        Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM $table"));
    return count;
  }

  Future<List<EmployeesModel>> getQueryData({required dynamic query}) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.rawQuery(query);
    return List.generate(maps.length, (i) {
      return EmployeesModel.fromMap(maps[i]);
    });
    /*int? count =
        Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM $table"));
    return count;*/
  }
}
