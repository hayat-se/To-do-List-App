import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static Database? _db;
  DatabaseHelper._privateConstructor();

  final String databaseTableName = "tasks";
  final String dbIdColoumName = "id";
  final String dbContentColoumName = "content";
  final String dbStatusColoumName = "status";

  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  static  DatabaseHelper get instance => _instance;

  Future<Database> get database async{
    if(_db != null){
      return _db!;
    }else{
      _db = await getDatabase();
      return _db!;
    }
  }


  Future<Database> getDatabase() async{
    final dirPath = await getDatabasesPath();
    final dataBasePath = join(dirPath, "master_db.db");
    final database = await openDatabase(
      dataBasePath,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $databaseTableName(
        $dbIdColoumName INT PRIMARY KEY,
        $dbContentColoumName TEXT NOT NULL,
        $dbStatusColoumName INT NOT NULL,
        )
        ''');
      },
    );
    return database;
  }
}