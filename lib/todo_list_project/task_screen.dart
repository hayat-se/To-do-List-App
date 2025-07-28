import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, required String this.listName});

  final String listName;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String> _itemList = [];
  TextEditingController _itemController = TextEditingController();

  @override
  void initState() {
    loadListData();
    // TODO: implement initState
    super.initState();
  }

  // void loadUserData() async {
  //   SharedPreferences db = await SharedPreferences.getInstance();
  //   _itemList.add(db.getStringList(widget.listName).toString());
  // }

  void loadListData() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    List<String>? savedList = db.getStringList(widget.listName);
    if (savedList != null) {
      setState(() {
        _itemList = savedList;
      });
    }
  }

  void _saveList() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    await db.setStringList(widget.listName, _itemList);
  }

  void deleteListItem(int indx) async {
    SharedPreferences db = await SharedPreferences.getInstance();
    setState(() {
      _itemList.removeAt(indx);
    });
    _saveList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemCount: _itemList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _itemList.removeAt(index);
                            });
                            _saveList();
                          },
                          child: Icon(Icons.check_box_outline_blank),
                        ),
                        SizedBox(width: 10,),
                        Text(_itemList[index], style: TextStyle(fontSize: 20)),
                        Spacer(),
                        GestureDetector(
                          onTap : () {
                            deleteListItem(index);
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 25,
              right: 25,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: TextFormField(
                            controller: _itemController,
                            decoration: InputDecoration(hintText: "Add Item"),
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
                                setState(() {
                                  _itemList.add(_itemController.text);
                                  _saveList();
                                  Navigator.pop(context);
                                  _itemController.clear();
                                });
                              },
                              child: Text("Add"),
                            ),
                          ],
                        );
                      },
                    );
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text("Add List item"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
