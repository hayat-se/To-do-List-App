import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text("Page 1"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome to Page 1",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
