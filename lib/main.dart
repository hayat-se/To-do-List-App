import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:summers_learning_1/Firebase/Firebase_CRUD_operation.dart';
import 'package:summers_learning_1/Sqlite%20DB/screens/db_home_screen.dart';
import 'package:summers_learning_1/Week1/HomeScreen.dart';
import 'package:summers_learning_1/Week1/LoginScreen.dart';
import 'package:summers_learning_1/Week1/splash_screen.dart';
import 'package:summers_learning_1/todo_list_project/todo_homescreen.dart';

import 'Databases/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(color: Colors.blue.shade200),
      ),
      debugShowCheckedModeBanner: false,
      home: DatabaseScreen(),
    );
  }
}
