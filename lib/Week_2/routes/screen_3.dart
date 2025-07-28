import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome to Page 3",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
