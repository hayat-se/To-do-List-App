import 'package:flutter/material.dart';

class DialogWidgetScreen extends StatefulWidget {
  const DialogWidgetScreen({super.key});

  @override
  State<DialogWidgetScreen> createState() => _DialogWidgetScreenState();
}

class _DialogWidgetScreenState extends State<DialogWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialog Wigdet")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Alert"),
                  content: Text("Something Went wrong"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancle"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Okay"),
                    ),
                  ],
                );
              },
            );
          },
          child: Text("Click"),
        ),
      ),
    );
  }
}
