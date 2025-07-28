import 'package:flutter/material.dart';

class tasksContainer extends StatefulWidget {
  const tasksContainer({super.key, required String this.tasks});
  final String tasks ;
  @override
  State<tasksContainer> createState() => _tasksContainerState();
}

class _tasksContainerState extends State<tasksContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Text(widget.tasks, style: TextStyle(fontSize: 18),),
    );
  }
}
