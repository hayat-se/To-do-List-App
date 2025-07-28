import 'package:flutter/material.dart';

class RadioWidgetScreen extends StatefulWidget {
  const RadioWidgetScreen({super.key});

  @override
  State<RadioWidgetScreen> createState() => _RadioWidgetScreenState();
}

class _RadioWidgetScreenState extends State<RadioWidgetScreen> {
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Radio Widget")),
      body: ListView(
        children: [
          ListTile(
            leading: Radio(
              value: 0,
              groupValue: _selectedRadio,
              onChanged: (radio) {
                setState(() {
                  _selectedRadio = radio!;
                });
              },
            ),
            title: Text("Flutter"),
          ),
          ListTile(
            leading: Radio(
              value: 1,
              groupValue: _selectedRadio,
              onChanged: (radio) {
                setState(() {
                  _selectedRadio = radio!;
                });
              },
            ),
            title: Text("React Native"),
          ),
          ListTile(
            leading: Radio(
              value: 2,
              groupValue: _selectedRadio,
              onChanged: (radio) {
                setState(() {
                  _selectedRadio = radio!;
                });
              },
            ),
            title: Text("Kotlin"),
          ),
        ],
      ),
    );
  }
}
