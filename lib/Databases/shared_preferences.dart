import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDatabase extends StatefulWidget {
  const SharedPreferencesDatabase({super.key});

  @override
  State<SharedPreferencesDatabase> createState() =>
      _SharedPreferencesDatabaseState();
}

class _SharedPreferencesDatabaseState extends State<SharedPreferencesDatabase> {
  TextEditingController _nameController = TextEditingController();
  late String name;

  void changeName() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    setState(() {
      name = db.getString("name")!;
    });
  }

  @override
  void initState() {
    changeName();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: name.isNotEmpty ? Text("Welcome, $name") : Text("NO Name set"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter your Name ",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              String name = _nameController.text;
              SharedPreferences db = await SharedPreferences.getInstance();
              db.setString("name", name);
            },
            child: Text("Save Name"),
          ),
          ElevatedButton(onPressed: (){
            changeName();
          }, child: Text("Change name"))
        ],
      ),
    );
  }
}
