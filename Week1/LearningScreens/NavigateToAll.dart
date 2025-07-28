import 'package:flutter/material.dart';
import 'package:summers_learning_1/LearningScreens/GridView.dart';
import 'package:summers_learning_1/LearningScreens/PageView.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Root Screen"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade300,
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewWidget()),
                );
              },
              child: Text("Grid View"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageWidget()),
                );
              },
              child: Text("HomeView"),
            ),
          ],
        ),
      ),
    );
  }
}
