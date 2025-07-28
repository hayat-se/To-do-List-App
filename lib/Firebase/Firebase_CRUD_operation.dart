import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase CRUD Operation")),
      body: Column(
        children: [
          // ElevatedButton(
          //   onPressed: () {
          //     _createUser(User(username: "hayat-se", password: "12345"));
          //   },
          //   child: Text("Save Data"),
          // ),
          ElevatedButton(
              onPressed: (){},
              child: Text("Get Data"))
        ],
      ),
    );
  }

  _readData(){
    // return Text
  }

  _createUser(User user) {
    final userCollection = FirebaseFirestore.instance.collection("users");

    String id = userCollection.doc().id;
    final newUser = User(
      username: user.username,
      password: user.password,
    ).dataToJson();

    userCollection.doc(id).set(newUser);

  }
}

class User {
  String? username;
  String? password;

  User({this.username, this.password});

  Map<String, dynamic> dataToJson() {
    return {"username": username, "password": password};
  }
}
