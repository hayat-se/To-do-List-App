import 'package:flutter/material.dart';
import 'package:summers_learning_1/Sqlite%20DB/helper/database_helper.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  final DatabaseHelper _databaseService = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SQLITE")));
  }
}
