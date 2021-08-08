import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled_todo/Models/task_model.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  static final String dbName = 'tasks.db';
  static final String tableName = 'tasks';
  static final String idColumn = 'id';
  static final String taskNameColumn = 'taskName';
  static final String isCompleteColumn = 'isComplete';
  Database database;

  initDataBase() async {
    database = await createConnection();
  }

  Future<Database> createConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Database database = await openDatabase(join(directory.path, dbName),
        version: 1, onCreate: (db, version) {
      db.execute(
          '''CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $taskNameColumn TEXT, $isCompleteColumn INTEGER )''');
    });
    return database;
  }

  Future<int> createNewTask(Task_model task_model) async {
    try {
      int rowCount = await database.insert(tableName, task_model.toMap());
      return rowCount;
    } catch (e) {
      return null;
    }
  }

  Future<List<Task_model>> getAllTasks() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName);
      List<Task_model> tasks =
          results.map((e) => Task_model.fromMap(e)).toList();
      return tasks;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateTask(Task_model task_model) async {
    try {
      await database.update(tableName, task_model.toMap(),
          where: '$idColumn=?', whereArgs: [task_model.id]);
      return true;
    } catch (x) {
      return null;
    }
  }

  Future<bool> deleteTask(Task_model task_model) async {
    try {
      await database
          .delete(tableName, where: '$idColumn=?', whereArgs: [task_model.id]);
      return true;
    } catch (e) {
      return null;
    }
  }
}
