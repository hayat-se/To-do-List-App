import 'package:flutter/material.dart';
import '../helper/database_helper.dart';
import '../models/task_model.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  final DatabaseHelper _databaseService = DatabaseHelper.instance;

  String? _task = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addTaskButton(),
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.purple.shade50
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image(
                    image: AssetImage(
                      "assets/images/DashboardProfile.png",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Text(
                "Notes App",
                style: TextStyle(fontSize: 18, fontFamily: "Outfit Bold"),
              ),
              SizedBox(width: 100),
              Icon(Icons.notifications_none_rounded),
              SizedBox(width: 20),
              Icon(Icons.search),
              // Icon(),
              // Icon(),
            ],
          ),
        ),
      ),
        toolbarHeight: 80,
      ),
      body: Container(
        color: Colors.purple.shade50,
        padding: EdgeInsets.all(15),
          child: _taskList()),
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      backgroundColor: Colors.purple.shade50,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Add Task"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _task = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Task name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    if (_task != null) {
                      _databaseService.addTask(_task!);
                      setState(() {
                        _task = null;
                      });
                      Navigator.pop(context);
                    } else {
                      return;
                    }
                  },
                  child: Text("Done"),
                ),
              ],
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }

  Widget _taskList() {
    return FutureBuilder(
      future: _databaseService.getTask(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            Task task = snapshot.data![index];
            return ListTile(
              onLongPress: (){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("Delete Task ?"),
                    actions: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Text("Cancel")
                      ),
                      GestureDetector(
                        onTap: (){
                          _databaseService.deleteTask(task.id);
                          Navigator.pop(context);
                          setState(() {});
                        },
                          child: Text("Delete"),
                      ),
                    ],
                  );
                },
                );
              },
              title: Text(task.content, style: TextStyle(fontFamily: "Outfit Variable",fontWeight: FontWeight.bold,fontSize: 18),),
              trailing: Checkbox(value: task.status == 1, onChanged: (value){
                setState(() {
                  _databaseService.updateTaskStatus(task.id, value! ? 1 : 0);
                });
              }),
            );
        },);
      },
    );
  }
}
