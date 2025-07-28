import 'package:flutter/material.dart';

class PopupMenuScreen extends StatefulWidget {
  const PopupMenuScreen({super.key});

  @override
  State<PopupMenuScreen> createState() => _PopupMenuScreenState();
}

class _PopupMenuScreenState extends State<PopupMenuScreen> {
  int _selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popup Menu"),
        actions: [
          PopupMenuButton(
            onSelected: (menu){
              setState(() {
                _selectedMenu = menu;
              });
            },
            initialValue: _selectedMenu,
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("Item 1"), value: 0,),
                PopupMenuItem(child: Text("Item 2"), value: 1,),
                PopupMenuItem(child: Text("Item 3"), value: 2,),
              ];
            },
          ),
        ],
      ),
    );
  }
}
