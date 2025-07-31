import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:summers_learning_1/Sqlite%20DB/models/task_model.dart';

class DatabaseHelper {
  static Database? _db;

  DatabaseHelper._privateConstructor();

  final String databaseTableName = "tasks";
  final String dbIdColoumName = "id";
  final String dbContentColoumName = "content";
  final String dbStatusColoumName = "status";

  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  static DatabaseHelper get instance => _instance;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await getDatabase();
      return _db!;
    }
  }

  Future<Database> getDatabase() async {
    final dirPath = await getDatabasesPath();
    final dataBasePath = join(dirPath, "master_db.db");
    final database = await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE $databaseTableName(
        $dbIdColoumName INTEGER PRIMARY KEY,
        $dbContentColoumName TEXT NOT NULL,
        $dbStatusColoumName INTEGER NOT NULL
        )
        ''');
      },
    );
    return database;
  }

  Future<void> addTask(String content) async {
    final db = await database;
    await db.insert(databaseTableName, {
      dbContentColoumName: content,
      dbStatusColoumName: 0,
    });
  }

  Future<List<Task>?> getTask() async {
    final db = await database;
    final data = await db.query(databaseTableName);

    List<Task> tasks = data
        .map(
          (e) => Task(
            id: e["id"] as int,
            content: e["content"] as String,
            status: e["status"] as int,
          ),
        )
        .toList();
    return tasks;
  }

  void updateTaskStatus(int id, int status) async {
    final db = await database;
    await db.update(
      databaseTableName,
      {dbStatusColoumName: status},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  void deleteTask(int id) async {
    final db = await database;
    db.delete(
      databaseTableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
