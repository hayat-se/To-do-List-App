import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome to Page 2",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
