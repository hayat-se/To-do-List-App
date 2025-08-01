import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:summers_learning_1/Firebase/DB%20helper/firebaseprovider.dart';

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  FirestoreService firebaseService = FirestoreService();

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _changeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Container(
          margin: EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              "Firebase Service",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Outfit Variable",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addNewTask();
        },
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: Colors.lightBlue.shade50,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                "List of Tasks",
                style: TextStyle(fontSize: 22, fontFamily: "Outfit Bold"),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: firebaseService.readDataStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List data = snapshot.data!.docs;

                    if (data.isEmpty) {
                      return Center(
                        child: Text(
                          "No Task found !!!",
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Outfit Variable",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = data[index];
                        String docID = document.id;

                        Map<String, dynamic> dataMap =
                            document.data() as Map<String, dynamic>;
                        String contentName = dataMap["content"];

                        return Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Checkbox(
                                value: dataMap["status"],
                                onChanged: (value) {
                                  firebaseService.markAsCompleted(docID);
                                },
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            "Update Task",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Outfit Bold",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: TextFormField(
                                            controller: _changeTextController,
                                            decoration: InputDecoration(
                                              hintText: "Change Task...",
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                firebaseService.updateTask(
                                                  docID,
                                                  _changeTextController.text,
                                                );
                                                Navigator.pop(context);
                                                _changeTextController.clear();
                                              },
                                              child: Text("Change"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit, size: 20),
                                ),
                                IconButton(onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Delete Task ?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel"),
                                          ),
                                          SizedBox(width: 10),
                                          TextButton(
                                            onPressed: () {
                                              firebaseService.deleteNotes(docID);

                                              Navigator.pop(context);
                                            },
                                            child: Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }, icon: Icon(Icons.delete, size: 20,))
                              ],
                            ),
                            title: Text(
                              contentName,
                              style: TextStyle(
                                decoration: dataMap["status"] == true ? TextDecoration.lineThrough : null,
                                fontSize: 16,
                                fontFamily: "Outfit Variable",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextFormField(controller: _textController),
          actions: [
            MaterialButton(
              onPressed: () {
                // add task
                firebaseService.addNotes(_textController.text);
                // clear Text Field
                _textController.clear();
                // close dialog
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
