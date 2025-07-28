import 'package:flutter/material.dart';


class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  List _isChecked = [false,false,false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Box Screen"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return listTile(title: "Item $index", index: index);
        },
      ),
    );
  }

  listTile({required String title,  required int index}) {
    return ListTile(
      leading: Checkbox(value: _isChecked[index], onChanged: (check){
        setState(() {
          _isChecked[index] = check!;
        });
      }),
      title: Text(title),
    );
  }
}
