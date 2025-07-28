import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summers_learning_1/todo_list_project/components/tasks_container.dart';
import 'package:summers_learning_1/todo_list_project/task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _listName = TextEditingController();
  late List<String> screenList;

  @override
  void initState() {
    // TODO: implement initState
    _loadScreenList();
    super.initState();
  }

  @override
  void dispose() {
    _listName.dispose();
    super.dispose();
  }

  void _loadScreenList() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    setState(() {
      screenList = db.getStringList("master list") ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                padding: EdgeInsetsGeometry.all(10),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
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
                      "Dashboard",
                      style: TextStyle(fontSize: 18, fontFamily: "Outfit Bold"),
                    ),
                    SizedBox(width: 80),
                    Icon(Icons.notifications_none_rounded),
                    SizedBox(width: 20),
                    Icon(Icons.search),
                    // Icon(),
                    // Icon(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: screenList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TaskScreen(listName: screenList[index],);
                                    },
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: tasksContainer(tasks: screenList[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 40,
                      child: GestureDetector(
                        onTap: () {
                          _createList();
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createList() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20),
          content: TextFormField(
            controller: _listName,
            decoration: InputDecoration(hintText: "Title "),
          ),
          actions: [
            Text("Cancle"),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _createTask(_listName.text);
                  Navigator.pop(context);
                });
              },
              child: Text("Create"),
            ),
          ],
        );
      },
    );
  }

  // void _createTask(String listName) async {
  //   SharedPreferences db = await SharedPreferences.getInstance();
  //   db.setStringList("master list", [listName] );
  //   setState(() {
  //     screenList.add(listName);
  //   });
  // }

  void _createTask(String listName) async {
    SharedPreferences db = await SharedPreferences.getInstance();
    List<String> existingLists = db.getStringList("master list") ?? [];

    if (!existingLists.contains(listName)) {
      existingLists.add(listName);
      await db.setStringList("master list", existingLists);
      setState(() {
        screenList = existingLists;
      });
    }
  }
}
